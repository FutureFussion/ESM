
class ChatModel {
  final String name;
  final String message;
  final String time;
  final String image;
  final bool isOnline;
  final int unreadCount;

  ChatModel({
    required this.name,
    required this.message,
    required this.time,
    required this.image,
    this.isOnline = false,
    this.unreadCount = 0,
  });
}
