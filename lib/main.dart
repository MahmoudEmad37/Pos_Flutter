import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pos_flutter/blocobserve.dart';
import 'package:pos_flutter/config/routes/router.dart';
import 'package:pos_flutter/config/style/app_colors.dart';
import 'package:pos_flutter/config/style/themes.dart';
import 'package:pos_flutter/core/utils/variables/routerkeys.dart';
import 'package:pos_flutter/injection_container.dart';
import 'package:pos_flutter/modules/home/domain/repositories/brand_repo/brand_repo.dart';
import 'package:pos_flutter/modules/home/domain/repositories/category_repo/category_repo.dart';
import 'package:pos_flutter/modules/home/domain/repositories/contact_repo/contact_repo.dart';
import 'package:pos_flutter/modules/home/domain/repositories/product_repo/product_repo.dart';
import 'package:pos_flutter/modules/home/presentation/cubits/brand_cubit/brand_cubit.dart';
import 'package:pos_flutter/modules/home/presentation/cubits/category_cubit.dart/category_cubit.dart';
import 'package:pos_flutter/modules/home/presentation/cubits/contact_cubit/contact_cubit.dart';
import 'package:pos_flutter/modules/home/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:pos_flutter/modules/internet/features/connection_internet/presentation/cubit/connection_internet_cubit.dart';
import 'package:pos_flutter/modules/main/presentation/cubits/app_cubit.dart';
import 'package:pos_flutter/modules/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  ServiceLocator.init();
  Bloc.observer = MyBlocObserver();
  //await initializeDateFormatting('ar');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(create: (context) => ConnectionInternetCubit()),
        BlocProvider(
            create: (context) => BrandCubit(sl<BrandRepo>())..getAllBrands()),
        BlocProvider(
            create: (context) =>
                CategoryCubit(sl<CategoryRepo>())..getAllCategories()),
        BlocProvider(
            create: (_) =>
                ProductCubit(sl<ProductRepo>())..getAllProducts(page: -1)),
        BlocProvider(
            create: (_) =>
                ContactCubit(sl<ContactRepo>())..getAllContacts(page: -1)),
      ],
      child: ScreenUtilInit(
          designSize: const Size(430, 932),
          builder: (_, child) => OKToast(
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: Themes.defaultTheme,
                  color: AppColors.white,
                  title: 'POS Flutter',
                  home: const SplashScreen(),
                  onGenerateRoute: RouterApp.generateRoute,
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const <Locale>[
                    Locale('en'),
                    Locale('ar'),
                  ],
                  locale: const Locale('ar'),
                  navigatorKey: RouterKeys.appNavigatorKey,
                ),
              )),
    );
  }
}
