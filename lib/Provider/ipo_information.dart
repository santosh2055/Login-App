import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_app/Model/sharemarket.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference ipoCollection =
      FirebaseFirestore.instance.collection('CurrentIPO');
  Future updateUserDataa(String companyName, String opeaningDate, closingDate,
      pricePerUnit, totalShareUnit, issueManager, status) async {
    return await ipoCollection.doc(uid).set({
      'companyName': companyName,
      'opeaningDate': opeaningDate,
      'closingDate': closingDate,
      'pricePerUnit': pricePerUnit,
      'totalShareUnit': totalShareUnit,
      'issueManager': issueManager,
      'status': status
    });
  }

  List<IPO> _ipoListfromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs
        .map((doc) => IPO(
            companyName: doc.get('companyName') ?? '',
            opeaningDate: doc.get('opeaningDate') ?? '',
            closingDate: doc.get('closingDate') ?? '',
            pricePerUnit: doc.get('pricePerUnit') ?? '',
            totalShareUnit: doc.get('totalShareUnit') ?? '',
            issueManager: doc.get('issueManager') ?? '',
            status: doc.get('status') ?? ''))
        .toList();
  }

  Stream<List<IPO>> get ipos {
    return ipoCollection.snapshots().map(_ipoListfromSnapshot);
  }
}
