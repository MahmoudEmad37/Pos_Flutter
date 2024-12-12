import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_flutter/core/utils/variables/routerkeys.dart';
import 'package:pos_flutter/core/widgets/custom_internet_app_bar.dart';
import 'package:pos_flutter/core/widgets/drawer_navigation.dart';
import 'package:pos_flutter/modules/home/presentation/screens/home_screen.dart';
import 'package:pos_flutter/modules/main/presentation/cubits/app_cubit.dart';
import 'package:pos_flutter/modules/main/presentation/cubits/app_state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      final AppCubit appCubit = AppCubit.get(context);

      return  Scaffold(
        key: RouterKeys.mainNavigatorKey,
        appBar: customInternetAppBar(),
        extendBody: true,
        body: [
          const HomeScreen(),
          const HomeScreen(),
          const HomeScreen(),
          const HomeScreen(),
          const HomeScreen(),
          const HomeScreen(),
          const HomeScreen(),
        ][appCubit.currentIndex],
         
        
        drawer: DrawerNavigation(currentIndex: appCubit.currentIndex,
          onTap: appCubit.changeCurrentIndex,));
    }
    ); 
  }
}
