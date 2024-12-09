import 'package:app_shop_ease/core/extensions/context_extention.dart';
import 'package:app_shop_ease/next_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () {
            context.pushNamed(NextScreen.routeName);
          },
          child: Text('Next'),
          color: Colors.amber,
        ),
      ),
    );
  }
}
