import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:injectable/injectable.dart';

abstract class NetworkInfoBase {
  Future<bool> get isConnected;
}

@LazySingleton()
class NetworkInfo extends NetworkInfoBase {
  final DataConnectionChecker dataConnectionChecker;

  NetworkInfo(this.dataConnectionChecker);

  @override
  Future<bool> get isConnected => dataConnectionChecker.hasConnection;
}
