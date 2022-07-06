import 'package:feriavirtual/features/auth/services/auth_service.dart';
import 'package:feriavirtual/providers/universities_provider.dart';
import 'package:feriavirtual/providers/user_provider.dart';
import 'package:feriavirtual/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:feriavirtual/router.dart';
import 'package:feriavirtual/constants/global_variables.dart';

//firmao

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider()),
    ChangeNotifierProvider(create: (_) => UniversitiesProvider()),
  ], child: const MyApp()));
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UniversitiesProvider())
      ],
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
  // This widget is the root of your application.

}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'details': (_) => const University(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Feria Virtual',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? const MainPage()
          : const MainPageLogged(),
    );
  }
}
