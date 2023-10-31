import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie/src/user_repo.dart';
import 'package:movie/widgets/auth/auth_widget.dart';
import 'package:movie/widgets/main_screen/main_screen_widget.dart';
import 'package:movie/widgets/onbording/onbording.dart';

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  const MyApp(this.userRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'КиноМагия',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(3, 57, 221, 24),
        ),
      ),
      routes: {
        '/onbourding': (context) => const OnboardingScreen(),
        '/auth': (context) => const AuthWidget(),
        '/main_screen': (context) => const MainScreenWidget(),
      },
      initialRoute: '/onbourding',
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text('Произошла ошибка перезойдите в приложение!'),
            ),
          );
        });
      },
    );
  }
}
