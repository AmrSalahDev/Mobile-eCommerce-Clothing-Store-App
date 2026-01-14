import 'package:bloc/bloc.dart';
import 'package:ecommerce_clothing/core/assets_gen/colors.gen.dart';
import 'package:ecommerce_clothing/core/di/di.dart';
import 'package:ecommerce_clothing/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter_toolkit/ui/system/system_ui_wrapper.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';

void main() {
  configureDependencies();

  Bloc.observer = TalkerBlocObserver();

  runApp(const EcommerceClothingApp());
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
        statusBarColor: ColorName.greyVeryLight,
        navigationBarColor: ColorName.greyVeryLight,
        statusBarIconBrightness: Brightness.dark,
        navigationBarIconBrightness: Brightness.dark,
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          title: 'Ecommerce Clothing',
          theme: _buildThemeData(),
        ),
      ),
    );
  }

  ThemeData _buildThemeData() {
    final base = ThemeData.light();
    return base.copyWith(
      scaffoldBackgroundColor: ColorName.greyVeryLight,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorName.charcoalDark,
        selectionColor: ColorName.greyLight,
        selectionHandleColor: ColorName.charcoalDark,
      ),
      primaryColor: ColorName.greyVeryLight,
    );
  }
}
