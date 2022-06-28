import 'package:flutter/material.dart';
import 'package:care_archives/config/database.dart';
import 'package:care_archives/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseUtils().initDatabase();
  runApp(MyApp());
}

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

MaterialColor colorCustom = MaterialColor(0xFF00c2cb, color);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CareArchive',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: colorCustom,
        textTheme: Theme.of(context).textTheme.apply(
            fontFamily: 'Roboto',
            bodyColor: Colors.black87,
            displayColor: Colors.black87),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      /*onGenerateRoute: (RouteSettings settings) {
        print('build route for ${settings.name}');
        var routes = <String, WidgetBuilder>{
          '/': (context) => Login(),
          '/register': (context) => Register(),
          '/home': (context) => HomePage(),
          '/sleep': (context) => SleepPage(),
          '/settings': (context) => SettingsPage(),
          '/patient': (context) => UserNew(),
          '/patients': (context) => UserList(),
          '/patient_show': (context) => UserShow(),
          '/medicine': (context) => MedicineNew(),
          '/medicines': (context) => SettingsPage(),
          '/activities': (context) => SettingsPage(),
          '/users': (context) => UserList(),
          '/user': (context) => UserNew(),
          '/activity': (context) => ActivityPage(activity: settings.arguments),
          '/panel': (context) => ActivityList(),
        };
        WidgetBuilder builder = routes[settings.name];
        return MaterialPageRoute(builder: (context) => builder(context));
      },*/
    );
  }
}
