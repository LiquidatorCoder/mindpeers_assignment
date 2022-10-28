import 'package:flutter/material.dart';
import 'package:mindpeers/common/helpers/navigation_helper.dart';
import 'package:mindpeers/common/router/router.gr.dart';
import 'package:mindpeers/utils/common/store_helper.dart';
import 'package:mindpeers/widget_extends/sf_widget.dart';
import 'package:mobx/mobx.dart';

class HomeScreen extends StatefulWidget {
  final String? dummyValue;

  const HomeScreen({Key? key, this.dummyValue}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends SfWidget {
  late final List<ReactionDisposer> _disposers;

  bool test = false;

  @override
  void initState() {
    _disposers = [];

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Widget buildLoginLogoutBtn(
    BuildContext context, {
    required bool isLoggedIn,
  }) {
    if (isLoggedIn) {
      return ElevatedButton(
        onPressed: () {},
        child: const Text('Logout'),
      );
    }

    return ElevatedButton(
      onPressed: () {},
      child: const Text('Login'),
    );
  }

  @override
  void dispose() {
    disposeStore(_disposers);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MindPeers'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text(
                'Home',
                style: TextStyle(fontSize: 18),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                navigateToRoute(
                  context: context,
                  route: PageNotFoundRoute(routeName: ''),
                );
              },
              child: const Text('404'),
            ),
          ],
        ),
      ),
    );
  }
}
