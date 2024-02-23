import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nfc_data_logger/constants/firestore_collections.dart';

class NfcDataRepository {
  final FirebaseFirestore firestore;

  NfcDataRepository({required this.firestore});

  CollectionReference get collectionRef =>
      firestore.collection(FirestoreCollections.nfcData);

  Future<void> set(Map<String, dynamic> data) {
    return collectionRef.doc(data["id"]).set(data);
  }

  Future<DocumentReference> add(Map<String, dynamic> data) {
    return collectionRef.add(data);
  }

  Future<DocumentSnapshot> find(String? id) async {
    return await collectionRef.doc(id).get();
  }

  Future<QuerySnapshot> get({
    List? list,
    int limit = 25,
  }) {
    Query query = collectionRef;
    if (list != null) {
      if (list.isNotEmpty) {
        query = query.startAfterDocument(list[list.length - 1]);
      }
      query = query.limit(limit);
    }
    query = query.orderBy("createdAt", descending: true);
    return query.get();
  }

  Future<void> update(String id, Map<String, dynamic> data) {
    return collectionRef.doc(id).update(data);
  }

  Future<void> delete(String id) {
    return collectionRef.doc(id).delete();
  }
}
