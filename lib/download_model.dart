/*
 * Copyright (c) 田梓萱[小草林] 2021-2024.
 * All Rights Reserved.
 * All codes are protected by China's regulations on the protection of computer software, and infringement must be investigated.
 * 版权所有 (c) 田梓萱[小草林] 2021-2024.
 * 所有代码均受中国《计算机软件保护条例》保护，侵权必究.
 */

import "dart:io";

import "package:flutter/foundation.dart";

/// Available whisper models
enum WhisperModel {
  // no model
  none(""),

  /// tiny models for all languages
  tiny("tiny"),
  tinyQ5("tiny-q5_1"),
  /// tiny models for English only
  tinyEn("tiny.en"),
  tinyEnQ5("tiny.en-q5_1"),
  tinyEnQ8("tiny.en-q8_0"),

  /// base models for all languages
  base("base"),
  baseQ5("base-q5_1"),
  /// base models for English only
  baseEn("base.en"),
  baseEnQ5("base.en-q5_1"),

  /// small models for all languages
  small("small"),
  smallQ5("small-q5_1"),
  /// small models for English only
  smallEn("small.en"),
  smallEnQ5("small.en-q5_1"),

  /// medium models for all languages
  medium("medium"),
  mediumQ5("medium-q5_0"),
  /// medium models for English only
  mediumEn("medium.en"),
  mediumEnQ5("medium.en-q5_0"),

  /// large models for all languages
  largeV1("large-v1"),
  largeV2("large-v2"),
  largeV2Q5("large-v2-q5_0"),
  largeV3("large-v3"),
  largeV3Q5("large-v3-q5_0");

  const WhisperModel(this.modelName);

  /// Public name of model
  final String modelName;

  /// Get local path of model file
  String getPath(String dir) {
    return "$dir/ggml-$modelName.bin";
  }
}

/// Download [model] to [destinationPath]
Future<String> downloadModel(
    {required WhisperModel model,
    required String destinationPath,
    String? downloadHost}) async {
  if (kDebugMode) {
    debugPrint("Download model ${model.modelName}");
  }
  final httpClient = HttpClient();

  Uri modelUri;

  if (downloadHost == null || downloadHost.isEmpty) {
    /// Huggingface url to download model
    modelUri = Uri.parse(
      "https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-${model.modelName}.bin",
    );
  } else {
    modelUri = Uri.parse(
      "$downloadHost/ggml-${model.modelName}.bin",
    );
  }

  final request = await httpClient.getUrl(
    modelUri,
  );

  final response = await request.close();

  final file = File("$destinationPath/ggml-${model.modelName}.bin");
  final raf = file.openSync(mode: FileMode.write);

  await for (var chunk in response) {
    raf.writeFromSync(chunk);
  }

  await raf.close();

  if (kDebugMode) {
    debugPrint("Download Down . Path = ${file.path}");
  }
  return file.path;
}
