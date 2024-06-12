/*
 * Copyright (c) 田梓萱[小草林] 2021-2024.
 * All Rights Reserved.
 * All codes are protected by China's regulations on the protection of computer software, and infringement must be investigated.
 * 版权所有 (c) 田梓萱[小草林] 2021-2024.
 * 所有代码均受中国《计算机软件保护条例》保护，侵权必究.
 */

import "dart:convert";
import "dart:ffi";
import "dart:io";
import "dart:isolate";

import "package:ffi/ffi.dart";
import "package:flutter/foundation.dart";
import "package:path_provider/path_provider.dart";
import "package:whisper_flutter_new/bean/_models.dart";
import "package:whisper_flutter_new/bean/whisper_dto.dart";
import "package:whisper_flutter_new/download_model.dart";
import "package:whisper_flutter_new/whisper_bindings_generated.dart";

export "package:whisper_flutter_new/bean/_models.dart";
export "package:whisper_flutter_new/download_model.dart" show WhisperModel;

/// Entry point of whisper_flutter_plus
class Whisper {
  /// [model] is required
  /// [modelDir] is path where downloaded model will be stored.
  /// Default to library directory
  const Whisper({required this.model, this.modelDir, this.downloadHost});

  /// model used for transcription
  final WhisperModel model;

  /// override of model storage path
  final String? modelDir;

  // override of model download host
  final String? downloadHost;

  DynamicLibrary _openLib() {
    if (Platform.isAndroid) {
      return DynamicLibrary.open("libwhisper.so");
    } else {
      return DynamicLibrary.process();
    }
  }

  Future<String> _getModelDir() async {
    if (modelDir != null) {
      return modelDir!;
    }
    final Directory libraryDirectory = Platform.isAndroid
        ? await getApplicationSupportDirectory()
        : await getLibraryDirectory();
    return libraryDirectory.path;
  }

  Future<void> _initModel() async {
    final String modelDir = await _getModelDir();
    final File modelFile = File(model.getPath(modelDir));
    final bool isModelExist = modelFile.existsSync();
    if (isModelExist) {
      if (kDebugMode) {
        debugPrint("Use existing model ${model.modelName}");
      }
      return;
    } else {
      await downloadModel(
          model: model, destinationPath: modelDir, downloadHost: downloadHost);
    }
  }

  Future<Map<String, dynamic>> _request({
    required WhisperRequestDto whisperRequest,
  }) async {
    if (model != WhisperModel.none) {
      await _initModel();
    }
    return Isolate.run(
      () async {
        final Pointer<Utf8> data =
            whisperRequest.toRequestString().toNativeUtf8();
        final Pointer<Char> res =
            WhisperFlutterBindings(_openLib()).request(data.cast<Char>());
        final Map<String, dynamic> result = json.decode(
          res.cast<Utf8>().toDartString(),
        ) as Map<String, dynamic>;
        try {
          malloc.free(data);
          malloc.free(res);
        } catch (_) {}
        if (kDebugMode) {
          debugPrint("Result =  $result");
        }
        return result;
      },
    );
  }

  /// Transcribe audio file to text
  Future<WhisperTranscribeResponse> transcribe({
    required TranscribeRequest transcribeRequest,
  }) async {
    final String modelDir = await _getModelDir();
    final Map<String, dynamic> result = await _request(
      whisperRequest: TranscribeRequestDto.fromTranscribeRequest(
        transcribeRequest,
        model.getPath(modelDir),
      ),
    );
    if (kDebugMode) {
      debugPrint("Transcribe request $result");
    }
    if (result["text"] == null) {
      if (kDebugMode) {
        debugPrint('Transcribe Exception ${result['message']}');
      }
      throw Exception(result["message"]);
    }
    return WhisperTranscribeResponse.fromJson(result);
  }

  /// Get whisper version
  Future<String?> getVersion() async {
    final Map<String, dynamic> result = await _request(
      whisperRequest: const VersionRequest(),
    );

    final WhisperVersionResponse response = WhisperVersionResponse.fromJson(
      result,
    );
    return response.message;
  }
}
