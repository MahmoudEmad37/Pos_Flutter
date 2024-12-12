import 'package:flutter/material.dart';
import 'package:pos_flutter/config/routes/routes_name.dart';
import 'package:pos_flutter/modules/home/presentation/screens/home_screen.dart';
import 'package:pos_flutter/modules/main/main_screen.dart';
import 'package:pos_flutter/modules/splash_screen/splash_screen.dart';


class RouterApp{
  static Route<dynamic> generateRoute(RouteSettings settings){
    try{
      //var args = settings.arguments;
      switch(settings.name){
      case RoutesName.splash:
          return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutesName.mainScreen:
          return MaterialPageRoute(builder: (_) =>  const MainScreen());
      case RoutesName.homeScreen:
          return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
          return _errorRoute();
    }


    }catch (e) {
      return _errorRoute();
    }
    
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('خطأ'),
        ),
        body: const Center(
          child: Text('نعتذر حدث خطأ , الرجاء اعادة المحاولة'),
        ),
      );
    });
  }
}