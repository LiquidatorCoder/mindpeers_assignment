import 'package:data_channel/data_channel.dart';
import 'package:injectable/injectable.dart';
import 'package:mindpeers/features/test/data/models/test_question_model.dart';
import 'package:mindpeers/features/test/data/repositories/test_repository.dart';

@LazySingleton()
class TestController {
  final TestRepository _testRepository;

  TestController(this._testRepository);

  Future<DC<Exception, List<TestQuestionModel>>> getQuestionBank() async {
    return _testRepository.getQuestionBank();
  }
}
