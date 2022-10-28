import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkInfoDi {
  @LazySingleton()
  DataConnectionChecker get dataConnectionChecker => DataConnectionChecker();
}
