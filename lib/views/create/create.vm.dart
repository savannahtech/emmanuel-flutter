import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nfc_data_logger/respositories/nfc_data.repository.dart';
import 'package:nfc_data_logger/utils/utils.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../../config/base.vm.dart';

class CreateViewModel extends BaseViewModel {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late NfcDataRepository repository;

  @override
  void initialise() async {
    super.initialise();
    repository = NfcDataRepository(firestore: firestore);
  }

  Future<bool> checkAvailability() async {
    bool isAvailable = await NfcManager.instance.isAvailable();
    Utils.log("NFC is available: $isAvailable");

    if (!isAvailable) {
      alert.show("NFC is not available for this device", success: false);
      return false;
    }

    return true;
  }

  discover() async {
    try {
      if (isLoading) {
        return stop();
      }

      setLoading(true);
      bool isAvailable = await checkAvailability();
      if (isAvailable) {
        NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
          Utils.log("NFC data is: ${tag.data}");

          await repository.set({
            "id": Timestamp.now().millisecondsSinceEpoch.toString(),
            "createdAt": Timestamp.now(),
            "data": tag.data,
          });

          alert.show("Data saved successfully", success: true);

          stop();
        });
      } else {
        Utils.log("NFC is not available for this device");
        setLoading(false);
      }
    } catch (e) {
      Utils.log(e);
      stop();
    } finally {}
  }

  stop() {
    NfcManager.instance.stopSession();
    setLoading(false);
  }
}
