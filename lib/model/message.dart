import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String message;

  final Timestamp timestamp;

  const Message({
    required this.senderEmail,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.timestamp,
  });

  // convert a map
  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      'receiverId': receiverId,
      'message': message,
      'timestamp': timestamp,
    };
  }
}
