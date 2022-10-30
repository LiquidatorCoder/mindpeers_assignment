import 'package:injectable/injectable.dart';
import 'package:mindpeers/common/enums/state_status.dart';
import 'package:mindpeers/features/test/data/controllers/test_controller.dart';
import 'package:mindpeers/features/test/data/models/test_question_model.dart';
import 'package:mobx/mobx.dart';

part 'test_store.g.dart';

@LazySingleton()
class TestStore = _TestStoreBase with _$TestStore;

abstract class _TestStoreBase with Store {
  TestController testController;

  _TestStoreBase(
    this.testController,
  );

  @observable
  StateStatus getQuestionBankStatus = StateStatus.initial;

  @observable
  int currentQuestionIndex = 0;

  @computed
  int get numberOfQuestions => questionBank?.length ?? 0;

  @computed
  double get progress {
    if (numberOfQuestions == 0) {
      return 0;
    }

    return currentQuestionIndex / numberOfQuestions;
  }

  @computed
  TestQuestionModel? get currentQuestion {
    if (questionBank == null) {
      return null;
    }

    return questionBank![currentQuestionIndex];
  }

  @computed
  double get ballPosition => (progress * 190);

  @observable
  List<TestQuestionModel>? questionBank;

  @action
  void setCurrentQuestionIndex(int index) {
    currentQuestionIndex = index;
  }

  @action
  void nextQuestion() {
    if (currentQuestionIndex < numberOfQuestions) {
      currentQuestionIndex++;
    }
  }

  @action
  Future<void> getQuestionBank() async {
    getQuestionBankStatus = StateStatus.loading;
    final questionBankData = await testController.getQuestionBank();
    getQuestionBankStatus = StateStatus.success;

    questionBankData.pick(
      onError: (error) {
        questionBank = null;
      },
      onData: (data) {
        questionBank = data;
      },
    );
  }
}
