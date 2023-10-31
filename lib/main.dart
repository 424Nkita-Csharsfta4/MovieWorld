import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie/app.dart';
import 'package:movie/src/firebase_user_repo.dart';
import 'package:movie/widgets/auth/auth_widget.dart';
import 'package:movie/widgets/main_screen/main_screen_widget.dart';
import 'package:movie/widgets/onbording/onbording.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(FirebaseUserRepo()));
}
