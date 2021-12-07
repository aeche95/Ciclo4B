import 'package:ciclo_4_b/Widgets/widget_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return SnackBar(content: const Text("Error", textDirection: TextDirection.ltr,));
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return WidgetSplashScreen();
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return Center(child: Text("Loading...", textDirection: TextDirection.ltr,));
        },
      ),
    );
  }
}




