import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:letsmove_app/model/data/member.dart';
import 'package:letsmove_app/views/screens/paySubscription.dart';
import 'intro.dart';
import '../../views/blocs/Auth/bloc/auth_bloc.dart';

class FirestoreService {
  final FirebaseFirestore _firebaseCollection = FirebaseFirestore.instance;

  Stream<List<IntroModel>> getIntro() {
    return _firebaseCollection.collection('intro').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        print(data['title']);
        return IntroModel(
            title: data['title'], body: data['body'], image: data['image']);
      }).toList();
    });
  }

  Stream<List<MemberModel>> getMembers() {
    return _firebaseCollection
        .collection('UsersData')
        .where('isPending', isEqualTo: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
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
  }

  removeMember(String id) {
    _firebaseCollection
        .collection("UsersData")
        .doc(id)
        .update({'isPending': false});
  }
}
