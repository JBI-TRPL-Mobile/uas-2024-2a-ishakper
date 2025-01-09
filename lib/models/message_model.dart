class MessageModel {
  final String sender;
  final String content;
  final DateTime timestamp;

  MessageModel({
    required this.sender,
    required this.content,
    required this.timestamp,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      sender: json['sender'],
      content: json['content'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}
