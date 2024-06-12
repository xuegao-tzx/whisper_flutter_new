import "dart:io";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:path_provider/path_provider.dart";
import "package:record/record.dart";

class RecordController extends StateNotifier<bool> {
  RecordController() : super(false);

  final AudioRecorder _record = AudioRecorder();

  Future<void> startRecord() async {
    if (!await _record.hasPermission()) {
      return;
    }
    state = true;
    final Directory appDirectory = await getApplicationDocumentsDirectory();
    await _record.start(
      const RecordConfig(),
      // encoder: AudioEncoder.pcm16bit,
      // samplingRate: 16000,
      path: "${appDirectory.path}/test.m4a",
    );
  }

  Future<String?> stopRecord() async {
    final String? path = await _record.stop();
    state = false;
    return path;
  }
}

final recordControllerProvider =
    StateNotifierProvider.autoDispose<RecordController, bool>(
  (ref) => RecordController(),
);

class RecordPage extends ConsumerWidget {
  const RecordPage({super.key});

  static Future<String?> openRecordPage(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const RecordPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RecordController controller = ref.watch(
      recordControllerProvider.notifier,
    );
    final bool isRecording = ref.watch(recordControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Record"),
      ),
      body: SafeArea(
        child: Center(
          child: isRecording
              ? ElevatedButton(
                  onPressed: () async {
                    final String? outputPath = await controller.stopRecord();

                    if (outputPath != null) {
                      final File outputFile = File(outputPath);

                      print(outputFile.path);

                      Navigator.of(context).pop(outputFile.path);
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text("stop"),
                )
              : ElevatedButton(
                  onPressed: () async {
                    await controller.startRecord();
                  },
                  child: const Text("start"),
                ),
        ),
      ),
    );
  }
}
