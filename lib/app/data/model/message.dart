class MessageModel {
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String message;
  final DateTime dateTime;

  MessageModel(
      {required this.senderId,
      required this.senderEmail,
      required this.receiverId,
      required this.dateTime,
      required this.message});

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      'receiverId': receiverId,
      'message': message,
      'date_time': dateTime,
    };
  }
}
