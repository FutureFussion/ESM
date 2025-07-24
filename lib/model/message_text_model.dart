class ChatMessage {
  final String message;
  final String time;
  final bool isSender;
  final DateTime? day;

  ChatMessage({
    required this.message,
    required this.time,
    required this.isSender,
     this.day,
  });
}
