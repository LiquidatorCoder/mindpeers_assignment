import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mindpeers/common/di/di.dart';
import 'package:mindpeers/features/login/data/models/post_login_request_model.dart';
import 'package:mindpeers/features/login/ui/store/login_store.dart';
import 'package:mindpeers/utils/common/store_helper.dart';
import 'package:mindpeers/widget_extends/sf_widget.dart';
import 'package:mobx/mobx.dart';

class LoginScreen extends StatefulWidget {
  final PageRouteInfo? redirectOnLogin;

  const LoginScreen({
    Key? key,
    required this.redirectOnLogin,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends SfWidget<LoginScreen> {
  PageRouteInfo? get _redirectOnLogin => widget.redirectOnLogin;

  LoginStore get _loginStore => getIt<LoginStore>();

  late final List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _disposers = [];

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void doLogin(PostLoginRequestModel param) {
    _loginStore.doLogin(context, param, redirectOnLogin: _redirectOnLogin);
  }

  @override
  void dispose() {
    disposeStore(_disposers);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                doLogin(
                  const PostLoginRequestModel(
                    username: 'user',
                    password: 'password',
                  ),
                );
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
