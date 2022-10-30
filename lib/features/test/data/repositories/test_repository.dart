import 'package:data_channel/data_channel.dart';
import 'package:injectable/injectable.dart';
import 'package:mindpeers/features/test/data/data_sources/test_remote_data_source.dart';
import 'package:mindpeers/features/test/data/models/test_question_model.dart';

@LazySingleton()
class TestRepository {
  final TestRemoteDataSource _testRemoteDataSource;

  TestRepository(
    this._testRemoteDataSource,
  );

  Future<DC<Exception, List<TestQuestionModel>>> getQuestionBank() async {
    return _testRemoteDataSource.getQuestionBank();
  }
}
