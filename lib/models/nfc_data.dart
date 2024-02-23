import 'package:cloud_firestore/cloud_firestore.dart';

class NfcData {
  String? id;
  Timestamp? createdAt;
  Data? data;

  NfcData({this.id, this.createdAt, this.data});

  NfcData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['createdAt'] = createdAt;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Isodep? isodep;
  Nfca? nfca;

  Data({this.isodep, this.nfca});

  Data.fromJson(Map<String, dynamic> json) {
    isodep = json['isodep'] != null ? Isodep.fromJson(json['isodep']) : null;
    nfca = json['nfca'] != null ? Nfca.fromJson(json['nfca']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (isodep != null) {
      data['isodep'] = isodep!.toJson();
    }
    if (nfca != null) {
      data['nfca'] = nfca!.toJson();
    }
    return data;
  }
}

class Isodep {
  List<int>? identifier;
  dynamic hiLayerResponse;
  List<int>? historicalBytes;
  bool? isExtendedLengthApduSupported;
  int? maxTransceiveLength;
  int? timeout;

  Isodep(
      {this.identifier,
      this.hiLayerResponse,
      this.historicalBytes,
      this.isExtendedLengthApduSupported,
      this.maxTransceiveLength,
      this.timeout});

  Isodep.fromJson(Map<String, dynamic> json) {
    identifier = json['identifier'].cast<int>();
    hiLayerResponse = json['hiLayerResponse'];
    historicalBytes = json['historicalBytes'].cast<int>();
    isExtendedLengthApduSupported = json['isExtendedLengthApduSupported'];
    maxTransceiveLength = json['maxTransceiveLength'];
    timeout = json['timeout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identifier'] = identifier;
    data['hiLayerResponse'] = hiLayerResponse;
    data['historicalBytes'] = historicalBytes;
    data['isExtendedLengthApduSupported'] = isExtendedLengthApduSupported;
    data['maxTransceiveLength'] = maxTransceiveLength;
    data['timeout'] = timeout;
    return data;
  }
}

class Nfca {
  List<int>? identifier;
  List<int>? atqa;
  int? maxTransceiveLength;
  int? sak;
  int? timeout;

  Nfca(
      {this.identifier,
      this.atqa,
      this.maxTransceiveLength,
      this.sak,
      this.timeout});

  Nfca.fromJson(Map<String, dynamic> json) {
    identifier = json['identifier'].cast<int>();
    atqa = json['atqa'].cast<int>();
    maxTransceiveLength = json['maxTransceiveLength'];
    sak = json['sak'];
    timeout = json['timeout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identifier'] = identifier;
    data['atqa'] = atqa;
    data['maxTransceiveLength'] = maxTransceiveLength;
    data['sak'] = sak;
    data['timeout'] = timeout;
    return data;
  }
}
