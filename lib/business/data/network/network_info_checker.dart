import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetWorkInfoImplementer implements NetworkInfo {
  final DataConnectionChecker dataConnectionChecker;
  const NetWorkInfoImplementer({required this.dataConnectionChecker});
  @override
  Future<bool> get isConnected async {
    return await dataConnectionChecker.hasConnection;
  }
}
