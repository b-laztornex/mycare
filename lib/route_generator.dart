import 'package:flutter/material.dart';
import 'package:mycare_archive/ui/home/index.dart';
import 'package:mycare_archive/ui/categories/sleep/index.dart';
import 'package:mycare_archive/ui/login/index.dart';
import 'package:mycare_archive/ui/login/register.dart';
import 'package:mycare_archive/ui/activity/index.dart';
import 'package:mycare_archive/ui/settings/index.dart';
import 'package:mycare_archive/ui/settings/user_new.dart';
import 'package:mycare_archive/ui/settings/user_list.dart';
import 'package:mycare_archive/ui/settings/user_show.dart';
import 'package:mycare_archive/ui/settings/medicine_new.dart';
import 'package:mycare_archive/ui/settings/activity_list.dart';
import 'package:mycare_archive/main.dart';
import 'package:mycare_archive/model/user_model.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final dynamic args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Login());
      case '/register':
        return MaterialPageRoute(builder: (_) => Register());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/settings':
        return MaterialPageRoute(builder: (_) => SettingsPage());
      case '/patient':
        return MaterialPageRoute(builder: (_) => UserNew());
      case '/patients':
        return MaterialPageRoute(builder: (_) => UserList());
      case '/medicine':
        return MaterialPageRoute(builder: (_) => MedicineNew());
      case '/medicines':
        return MaterialPageRoute(builder: (_) => MedicineNew());
      case '/patient_show':
        // Validation of correct data type
        print(args);
        if (args is UserModel) {
          return MaterialPageRoute(
            builder: (_) => UserShow(
              data: args,
            ),
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
