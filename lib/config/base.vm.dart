import 'package:flutter/material.dart';

import '../models/session.dart';
import 'config.dart';
import '../services/alert.service.dart';
import '../services/bottom_sheet.service.dart';

class BaseViewModel with ChangeNotifier {
  // Services
  final alert = AlertService();
  final bottomSheet = BottomSheetService();

  // Variables
  bool _isLoading = false;
  bool _listLoading = false;
  late BuildContext _context;
  bool _firstTimeDataLoad = true;
  String errorMsg = "Something went wrong, Please try again!";

  final Map<int, bool> _loadingStates = <int, bool>{};

  // Getters
  bool get isLoading => _isLoading;
  bool get listLoading => _listLoading;
  BuildContext get context => _context;

  // Functions
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setListLoading(bool value) {
    if (_firstTimeDataLoad) {
      _listLoading = value;
      _firstTimeDataLoad = false;
    } else {
      _listLoading = false;
    }
    _isLoading = value;
    notifyListeners();
  }

  void setDynamicLoading(Object object, bool value) {
    _loadingStates[object.hashCode] = value;
    notifyListeners();
  }

  void initialise() {
    _context = AppConfig.currentContext;
  }

  Session get session => Session.current;

  void reset() {}

  void refresh() {
    reset();
  }

  void setState() {
    notifyListeners();
  }
}
