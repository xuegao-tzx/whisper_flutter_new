/*
 * Copyright (c) 田梓萱[小草林] 2021-2024.
 * All Rights Reserved.
 * All codes are protected by China's regulations on the protection of computer software, and infringement must be investigated.
 * 版权所有 (c) 田梓萱[小草林] 2021-2024.
 * 所有代码均受中国《计算机软件保护条例》保护，侵权必究.
 */

import "dart:io";

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:path_provider/path_provider.dart";
import "package:test_whisper/providers.dart";
import "package:test_whisper/record_page.dart";
import "package:test_whisper/whisper_controller.dart";
import "package:test_whisper/whisper_result.dart";
import "package:whisper_flutter_new/whisper_flutter_new.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: "Whisper for Flutter",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Theme.of(context).colorScheme.primary),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final WhisperModel model = ref.watch(modelProvider);
    final String lang = ref.watch(langProvider);
    final bool translate = ref.watch(translateProvider);
    final bool withSegments = ref.watch(withSegmentsProvider);
    final bool splitWords = ref.watch(splitWordsProvider);

    final WhisperController controller = ref.watch(
      whisperControllerProvider.notifier,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "Whisper flutter demo",
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: SingleChildScrollView(child: Consumer(
          builder: (context, ref, _) {
            final AsyncValue<TranscribeResult?> transcriptionAsync = ref.watch(
              whisperControllerProvider,
            );

            return transcriptionAsync.maybeWhen(
              skipLoadingOnRefresh: true,
              skipLoadingOnReload: true,
              data: (TranscribeResult? transcriptionResult) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const Text("Model :"),
                    DropdownButton(
                      isExpanded: true,
                      value: model,
                      items: WhisperModel.values
                          .map(
                            (WhisperModel model) => DropdownMenuItem(
                              value: model,
                              child: Text(model.modelName),
                            ),
                          )
                          .toList(),
                      onChanged: (WhisperModel? model) {
                        if (model != null) {
                          ref.read(modelProvider.notifier).state = model;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text("Lang :"),
                    DropdownButton(
                      isExpanded: true,
                      value: lang,
                      items: ["auto", "zh", "en"]
                          .map(
                            (String lang) => DropdownMenuItem(
                              value: lang,
                              child: Text(lang),
                            ),
                          )
                          .toList(),
                      onChanged: (String? lang) {
                        if (lang != null) {
                          ref.read(langProvider.notifier).state = lang;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text("Translate result :"),
                    DropdownButton(
                      isExpanded: true,
                      value: translate,
                      items: const [
                        DropdownMenuItem(
                          value: false,
                          child: Text("No"),
                        ),
                        DropdownMenuItem(
                          value: true,
                          child: Text("Yes"),
                        ),
                      ],
                      onChanged: (bool? translate) {
                        if (translate != null) {
                          ref.read(translateProvider.notifier).state =
                              translate;
                        }
                      },
                    ),
                    const Text("With segments :"),
                    DropdownButton(
                      isExpanded: true,
                      value: withSegments,
                      items: const [
                        DropdownMenuItem(
                          value: false,
                          child: Text("No"),
                        ),
                        DropdownMenuItem(
                          value: true,
                          child: Text("Yes"),
                        ),
                      ],
                      onChanged: (bool? withSegments) {
                        if (withSegments != null) {
                          ref.read(withSegmentsProvider.notifier).state =
                              withSegments;
                        }
                      },
                    ),
                    const Text("Split word :"),
                    DropdownButton(
                      isExpanded: true,
                      value: splitWords,
                      items: const [
                        DropdownMenuItem(
                          value: false,
                          child: Text("No"),
                        ),
                        DropdownMenuItem(
                          value: true,
                          child: Text("Yes"),
                        ),
                      ],
                      onChanged: (bool? splitWords) {
                        if (splitWords != null) {
                          ref.read(splitWordsProvider.notifier).state =
                              splitWords;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            final Directory documentDirectory =
                                await getApplicationDocumentsDirectory();
                            final ByteData documentBytes =
                                await rootBundle.load(
                              "assets/jfk.wav",
                            );

                            final String jfkPath =
                                "${documentDirectory.path}/jfk.wav";

                            await File(jfkPath).writeAsBytes(
                              documentBytes.buffer.asUint8List(),
                            );

                            await controller.transcribe(jfkPath);
                          },
                          child: const Text("jfk.wav"),
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () async {
                            final String? recordFilePath =
                                await RecordPage.openRecordPage(
                              context,
                            );

                            if (recordFilePath != null) {
                              await controller.transcribe(recordFilePath);
                            }
                          },
                          child: const Text("record"),
                        ),
                      ],
                    ),
                    if (transcriptionResult != null) ...[
                      const SizedBox(height: 20),
                      Text(
                        transcriptionResult.transcription.text,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        transcriptionResult.time.toString(),
                      ),
                      if (transcriptionResult.transcription.segments !=
                          null) ...[
                        const SizedBox(height: 25),
                        Expanded(
                          child: ListView.separated(
                            itemCount: transcriptionResult
                                .transcription.segments!.length,
                            itemBuilder: (context, index) {
                              final WhisperTranscribeSegment segment =
                                  transcriptionResult
                                      .transcription.segments![index];

                              final Duration fromTs = segment.fromTs;
                              final Duration toTs = segment.toTs;
                              final String text = segment.text;
                              return Text(
                                "[$fromTs - $toTs] $text",
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider();
                            },
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ],
                  ],
                );
              },
              orElse: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          },
        )),
      ),
    );
  }
}
