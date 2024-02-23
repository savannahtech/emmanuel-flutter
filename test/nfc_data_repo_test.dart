import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_data_logger/respositories/nfc_data.repository.dart';

void main() {
  group('NFC Data Repository', () {
    FakeFirebaseFirestore? firestore;
    NfcDataRepository? repository;
    const Map<String, dynamic> payload = {"id": "1"};

    setUp(() {
      firestore = FakeFirebaseFirestore();
      repository = NfcDataRepository(firestore: firestore!);
    });

    group('Collection Operations', () {
      test('create nfc data', () async {
        await repository!.set(payload);

        final docs = await repository!.get();
        expect(docs.docs.length, 1);
      });

      test('add nfc data', () async {
        final doc = await repository!.add(payload);
        expect(doc.id, isNotEmpty);
      });

      test('find nfc data', () async {
        final doc = await repository!.find('1');
        expect(doc.exists, isFalse);
      });

      test('get nfc data', () async {
        await repository!.add(payload);

        final docs = await repository!.get();
        expect(docs.docs.length, 1);
      });

      test('update nfc data', () async {
        await repository!.set(payload);
        await repository!.update('1', payload);

        final doc = await repository!.find('1');
        expect(doc.exists, isTrue);
      });

      test('delete nfc data', () async {
        await repository!.set(payload);
        await repository!.delete('1');

        final doc = await repository!.find('1');
        expect(doc.exists, isFalse);
      });
    });
  });
}
