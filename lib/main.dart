import 'package:flutter/material.dart';
import 'package:graduation_project/Screens/Pages/Diseases%20result/resultpage.dart';
import 'package:graduation_project/Screens/Pages/Register/Login/login%20screen.dart';
import 'package:graduation_project/Screens/Pages/Register/SignUp/SetProfile/SetProfileScreen.dart';
import 'package:graduation_project/Screens/Pages/Register/SignUp/Signup.dart';
import 'package:graduation_project/Screens/Pages/Start%20Page/startpage.dart';
import 'package:graduation_project/Screens/Pages/Tips/Tips_Screen.dart';
import 'Provider/provider.dart';
import 'Screens/Pages/Chatbot/chat.dart';
import 'Screens/Pages/Splash/splsh_screen.dart';
import 'package:provider/provider.dart';
  import 'package:firebase_core/firebase_core.dart';
  import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(DermEase());
}
class DermEase extends StatelessWidget{
  const DermEase({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AppProvider(), // Provide an instance of AppProvider
        child: Consumer<AppProvider>(
        builder: (context, appProvider, _) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'DermEase',
          theme: ThemeData.light(), // Light theme
          darkTheme: ThemeData.dark(), // Dark theme
          themeMode: appProvider.isDarkModeEnabled
              ? ThemeMode.dark
              : ThemeMode.light,
        routes: {
          ChatPage.id:(context)=>ChatPage(),
          SplashScreen.routeName:(context)=>SplashScreen(),
          StartPage.routeName:(context)=>StartPage(),
          Skin_Tips.routeName:(context)=>Skin_Tips(),
          LoginScreen.routeName:(context)=>LoginScreen(),
          SignupScreen.routeName:(context)=>SignupScreen(),
          SetProfileScreen.routeName:(context)=>SetProfileScreen(),
          // Result.routeName:(context)=>Result(),
        },// Use themeMode to switch between light and dark mode
        initialRoute: SplashScreen.routeName,
      );
      },
    ));






  }
}



