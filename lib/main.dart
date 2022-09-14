import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:webndcrafttest/loginscreen.dart';
import 'package:webndcrafttest/provider/loginprovider.dart';
import 'package:webndcrafttest/splashscreen.dart';

void main() {
  runApp(ChangeNotifierProvider<LoginProvider>(
    child: MyApp(),
    create: (_) => LoginProvider(), // Create a new ChangeNotifier object
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
