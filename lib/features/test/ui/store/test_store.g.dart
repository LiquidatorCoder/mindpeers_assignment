// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TestStore on _TestStoreBase, Store {
  Computed<int>? _$numberOfQuestionsComputed;

  @override
  int get numberOfQuestions => (_$numberOfQuestionsComputed ??= Computed<int>(
          () => super.numberOfQuestions,
          name: '_TestStoreBase.numberOfQuestions'))
      .value;
  Computed<double>? _$progressComputed;

  @override
  double get progress =>
      (_$progressComputed ??= Computed<double>(() => super.progress,
              name: '_TestStoreBase.progress'))
          .value;
  Computed<TestQuestionModel?>? _$currentQuestionComputed;

  @override
  TestQuestionModel? get currentQuestion => (_$currentQuestionComputed ??=
          Computed<TestQuestionModel?>(() => super.currentQuestion,
              name: '_TestStoreBase.currentQuestion'))
      .value;
  Computed<double>? _$ballPositionComputed;

  @override
  double get ballPosition =>
      (_$ballPositionComputed ??= Computed<double>(() => super.ballPosition,
              name: '_TestStoreBase.ballPosition'))
          .value;

  late final _$getQuestionBankStatusAtom =
      Atom(name: '_TestStoreBase.getQuestionBankStatus', context: context);

  @override
  StateStatus get getQuestionBankStatus {
    _$getQuestionBankStatusAtom.reportRead();
    return super.getQuestionBankStatus;
  }

  @override
  set getQuestionBankStatus(StateStatus value) {
    _$getQuestionBankStatusAtom.reportWrite(value, super.getQuestionBankStatus,
        () {
      super.getQuestionBankStatus = value;
    });
  }

  late final _$currentQuestionIndexAtom =
      Atom(name: '_TestStoreBase.currentQuestionIndex', context: context);

  @override
  int get currentQuestionIndex {
    _$currentQuestionIndexAtom.reportRead();
    return super.currentQuestionIndex;
  }

  @override
  set currentQuestionIndex(int value) {
    _$currentQuestionIndexAtom.reportWrite(value, super.currentQuestionIndex,
        () {
      super.currentQuestionIndex = value;
    });
  }

  late final _$questionBankAtom =
      Atom(name: '_TestStoreBase.questionBank', context: context);

  @override
  List<TestQuestionModel>? get questionBank {
    _$questionBankAtom.reportRead();
    return super.questionBank;
  }

  @override
  set questionBank(List<TestQuestionModel>? value) {
    _$questionBankAtom.reportWrite(value, super.questionBank, () {
      super.questionBank = value;
    });
  }

  late final _$getQuestionBankAsyncAction =
      AsyncAction('_TestStoreBase.getQuestionBank', context: context);

  @override
  Future<void> getQuestionBank() {
    return _$getQuestionBankAsyncAction.run(() => super.getQuestionBank());
  }

  late final _$_TestStoreBaseActionController =
      ActionController(name: '_TestStoreBase', context: context);

  @override
  void setCurrentQuestionIndex(int index) {
    final _$actionInfo = _$_TestStoreBaseActionController.startAction(
        name: '_TestStoreBase.setCurrentQuestionIndex');
    try {
      return super.setCurrentQuestionIndex(index);
    } finally {
      _$_TestStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextQuestion() {
    final _$actionInfo = _$_TestStoreBaseActionController.startAction(
        name: '_TestStoreBase.nextQuestion');
    try {
      return super.nextQuestion();
    } finally {
      _$_TestStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getQuestionBankStatus: ${getQuestionBankStatus},
currentQuestionIndex: ${currentQuestionIndex},
questionBank: ${questionBank},
numberOfQuestions: ${numberOfQuestions},
progress: ${progress},
currentQuestion: ${currentQuestion},
ballPosition: ${ballPosition}
    ''';
  }
}
