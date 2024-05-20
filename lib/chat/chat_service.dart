import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  // instance of firestore
  final FirebaseFirestore _instance = FirebaseFirestore.instance;

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

  // get message
}
