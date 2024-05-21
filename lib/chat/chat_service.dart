import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:telegram_copy/data/message_data/message_data.dart';

class ChatService {
  // instance of firestore
  final FirebaseFirestore _instance = FirebaseFirestore.instance;
  final FirebaseAuth _instanceAuth = FirebaseAuth.instance;

  // get users stream
  Stream<List<Map<String, dynamic>>> watchUsers() {
    return _instance.collection("/users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();

        return user;
      }).toList();
    });
  }

  // send message

  Future<void> sendMessage(String receiverId, String message) async {
    final String currentUserUid = _instanceAuth.currentUser!.uid;
    final String currentUserEmail = _instanceAuth.currentUser!.email!;

    final DateTime dateCreated = DateTime.now();

    MessageData newMessage = MessageData(
        senderId: currentUserUid,
        receiverId: receiverId,
        senderEmail: currentUserEmail,
        message: message,
        timestamp: dateCreated);

    List<String> ids = [currentUserUid, receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");

    await _instance
        .collection("/chats")
        .doc(chatRoomId)
        .collection("messages")
        .add(newMessage.toJson());
  }

  // get message
  Stream<QuerySnapshot> getMessages(String userId, otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    return _instance
        .collection("/chats")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("timestamp")
        .snapshots();
  }
}
