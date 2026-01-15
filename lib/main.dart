import 'package:bloc/bloc.dart';
import 'package:ecommerce_clothing/core/assets_gen/colors.gen.dart';
import 'package:ecommerce_clothing/core/di/di.dart';
import 'package:ecommerce_clothing/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter_toolkit/ui/system/system_ui_wrapper.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:ecommerce_clothing/core/constant/app_strings.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  configureDependencies();

  Bloc.observer = TalkerBlocObserver();

  runApp(const EcommerceClothingApp());

  FlutterNativeSplash.remove();
}

class EcommerceClothingApp extends StatelessWidget {
  const EcommerceClothingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: SystemUIWrapper(
        statusBarColor: ColorName.white,
        navigationBarColor: ColorName.white,
        statusBarIconBrightness: Brightness.dark,
        navigationBarIconBrightness: Brightness.dark,
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          title: AppStrings.appTitle,
          theme: _buildThemeData(),
        ),
      ),
    );
  }

  ThemeData _buildThemeData() {
    final base = ThemeData.light();
    return base.copyWith(
      scaffoldBackgroundColor: ColorName.white,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorName.charcoalDark,
        selectionColor: ColorName.greyLight,
        selectionHandleColor: ColorName.charcoalDark,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: ColorName.white,
        surfaceTintColor: ColorName.white,
        foregroundColor: ColorName.blackSoft,
        elevation: 0,
      ),
      primaryColor: ColorName.white,
    );
  }
}
