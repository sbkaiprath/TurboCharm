import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:turbocharm/models/user_data.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});
  final CollectionReference carCollection =
      FirebaseFirestore.instance.collection('car');

  Future updateUserData(String userCarId) async {
    return await carCollection.doc(uid).set({
      'userCarId': userCarId,
    });
  }

  //userdata from snapshot

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      userCarId: snapshot.data()['userCarId'],
    );
  }


  //get user doc

  Stream<UserData> get userData {
    return carCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
