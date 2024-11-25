import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pos_flutter/modules/drawer/navigation_drawer.dart' as drawer;
import 'package:pos_flutter/modules/internet/features/connection_internet/presentation/cubit/connection_internet_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await initializeDateFormatting('ar');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ConnectionInternetCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const <Locale>[
          Locale('en'),
          Locale('ar'),
          // ... other locales the app supports
        ],
        locale: const Locale('ar'),
        title: 'POS Flutter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          useMaterial3: true,
        ),
        home: drawer.NavigationDrawer(),
      ),
    );
  }
}
