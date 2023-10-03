import "package:internet_connection_checker_plus/internet_connection_checker_plus.dart";

abstract class NetworkStatus {
  Future<bool> get isConnected;
}

class NetworkStatusImpl implements NetworkStatus {
  final InternetConnection internetConnectionChecker;
  NetworkStatusImpl(this.internetConnectionChecker);
  @override
  Future<bool> get isConnected => internetConnectionChecker.hasInternetAccess;
}
