import 'dart:async';

import 'package:app_log/app_log.dart';
import 'package:connectivity/src/service/connectivity_service.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@LazySingleton(as: ConnectivityService)
class InternetConnectionCheckerConnectivityService implements ConnectivityService {
  late final InternetConnectionChecker _internetChecker = InternetConnectionChecker.I;
  final StreamController<bool> _connectionStatusStreamController = StreamController.broadcast();

  LogTag get _tag => LogTag.connectivity;

  bool _lastResult = false;

  @override
  Stream<bool> get onConnectionChange => _connectionStatusStreamController.stream.asBroadcastStream();

  StreamSubscription<InternetConnectionStatus>? _connectivitySubscription;

  Future<void> initialize() async {
    AppLog.I.i(_tag, "Subscribe to internet connectivity");
    _connectivitySubscription = _internetChecker.onStatusChange.listen((result) async {
      _lastResult = await _internetChecker.hasConnection;
      AppLog.I.i(_tag, _lastResult ? "Connected" : "No internet connection");
      _connectionStatusStreamController.add(_lastResult);
    });
  }

  @override
  Future<bool> hasInternetConnection() async {
    AppLog.I.i(_tag, "Checking for connectivity");
    var results = await _internetChecker.connectionStatus;

    AppLog.I.i(_tag, "Connectivity results : ${results.name}");
    bool hasConnection = await _internetChecker.hasConnection;
    _lastResult = hasConnection;

    return hasConnection;
  }

  void dispose() {
    _connectivitySubscription?.cancel();
    _connectionStatusStreamController.close();
  }

  @override
  bool get lastResult => _lastResult;
}
