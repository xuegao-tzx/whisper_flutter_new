import "package:whisper_flutter_new/whisper_flutter_new.dart";

class TranscribeResult {
  const TranscribeResult({
    required this.transcription,
    required this.time,
  });

  final WhisperTranscribeResponse transcription;
  final Duration time;
}
