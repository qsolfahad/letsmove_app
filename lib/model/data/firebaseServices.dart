import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:letsmove_app/model/data/constant.dart';
import 'package:letsmove_app/model/data/member.dart';
import '../../views/blocs/Auth/bloc/auth_bloc.dart';
import 'package:http/http.dart' as http;

class FirestoreService {
  final FirebaseFirestore _firebaseCollection = FirebaseFirestore.instance;

  Stream<List<MemberModel>> getMembers() {
    
    return _firebaseCollection
        .collection('UsersData')
        .where('isPending', isEqualTo: true)
        .snapshots(includeMetadataChanges: true)
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        print(data['name']);
        return MemberModel(
            id: doc.id,
            name: data['name'],
            email: data['email'],
            sub: data['subscription'].toString());
      }).toList();
    });
  }

  setUser(GetSignup event) {
    _firebaseCollection.collection('UsersData').add({
      'email': event.email,
      'name': event.fullname,
      'password': event.password,
      'isMemberShipAllow': event.isMemberShipAllow,
      'subscription': '',
      'isAdmin': event.isAdmin,
      'isPending': event.isPending
    });
  }

  Future<QuerySnapshot<Map<String, dynamic>>> checkAuth(GetLogin event) {
    return _firebaseCollection
        .collection("UsersData")
        .where("email", isEqualTo: event.email)
        .where("password", isEqualTo: event.password)
        .get();
  }

  updateMember(String id, String sub) {
    _firebaseCollection
        .collection("UsersData")
        .doc(id)
        .update({'isPending': true, 'subscription': sub});
  }

  addMember(String id) {
    _firebaseCollection
        .collection("UsersData")
        .doc(id)
        .update({'isPending': false, 'isMemberShipAllow': true});
    _sendPushMessage("Membership has been Approved",
        "You are successfully become a member", id);
  }

  removeMember(String id) {
    _firebaseCollection
        .collection("UsersData")
        .doc(id)
        .update({'isPending': false});
    _sendPushMessage(
        "Membership has been Rejected", "You are not become a member", id);
    Future.delayed(const Duration(seconds: 2), () async {
      _deleteToken(id);
    });
  }

  _deleteToken(id) async {
    FirebaseFirestore.instance.collection('userToken').doc(id).delete();
  }

  _sendPushMessage(String title, String body, String id) {
    _firebaseCollection
        .collection("userToken")
        .doc(id)
        .get()
        .then((value) async {
      try {
        String token = value.data()!['token'];
        print(token);
        Uri url = Uri.parse('https://fcm.googleapis.com/fcm/send');

        await http
            .post(url,
                headers: {
                  'content-Type': 'application/json',
                  'Authorization':authToken
                },
                body: jsonEncode({
                  'priority': 'high',
                  'data': {
                    'click_action': 'FLUTTER_NOTIFICATION_CLICK',
                    'status': 'done',
                    'body': body,
                    'title': title
                  },
                  'notification': {
                    'title': title,
                    'body': body,
                    'android_channel_id': 'dbfood'
                  },
                  'to': token
                }))
            .whenComplete(() {
          print('Message is send');
        });
      } catch (e) {
        print(e);
      }
    });
  }
}
