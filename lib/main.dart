import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/app.dart';
import 'firebase_options.dart';

Future<void> _initApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<void> main() async {
  await _initApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    _checkVersion();

    super.initState();
  }

  Future<void> _checkVersion() async {
    // await Updater.checkVersion(context);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ScreenUtilInit(
          useInheritedMediaQuery: true,
          designSize: Size(constraints.maxWidth, constraints.maxHeight),
          builder: (_, child) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Chat App',
            home: const CustomStreamBuilder(),
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                elevation: 0,
                scrolledUnderElevation: 1.5,
              ),
            ),
          ),
        );
      },
    );
  }
}
