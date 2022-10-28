import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';

abstract class SfWidget<S extends StatefulWidget> extends State<S>
    with AfterLayoutMixin<S> {
  @protected
  @override
  @mustCallSuper
  void initState() {
    super.initState();
  }

  @override
  @override
  @mustCallSuper
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        onWidgetUpdate();
      },
    );
  }

  @protected
  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    onInitApp();
  }

  @protected
  @override
  @mustCallSuper
  void dispose() {
    super.dispose();
  }

  Future<void> onInitApp() async {}

  Future<void> onWidgetUpdate() async {}
}
