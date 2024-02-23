import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nfc_data_logger/models/nfc_data.dart';
import 'package:nfc_data_logger/respositories/nfc_data.repository.dart';
import 'package:nfc_data_logger/utils/utils.dart';

import '../../config/base.vm.dart';

class HomeViewModel extends BaseViewModel {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late NfcDataRepository repository;
  List<NfcData> data = [];
  List<DocumentSnapshot> docSnaps = [];

  @override
  void initialise() async {
    super.initialise();
    repository = NfcDataRepository(firestore: firestore);

    getNfcData();
  }

  Future<void> getNfcData() async {
    setListLoading(true);
    try {
      QuerySnapshot snapshot = await repository.get();
      docSnaps.addAll(snapshot.docs);

      data = docSnaps
          .map((doc) => NfcData.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      Utils.log("Data fetched: ${docSnaps.length}");
    } catch (e) {
      Utils.log(e);
      alert.show(e.toString());
    } finally {
      setListLoading(false);
    }
  }
}
