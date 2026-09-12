import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_hub_app/core/router/app_router.dart';
import 'package:fruit_hub_app/core/services/bloc_observer.dart';
import 'package:fruit_hub_app/core/services/server_locator.dart';
import 'package:fruit_hub_app/core/theme/app_colors.dart';
import 'package:fruit_hub_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:fruit_hub_app/features/auth/domain/usecases/sign_with_facebook.dart';
import 'package:fruit_hub_app/features/auth/domain/usecases/sign_with_google_usecase.dart';
import 'package:fruit_hub_app/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:fruit_hub_app/firebase_options.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (Platform.isAndroid) {
    await GoogleSignIn.instance.initialize(
      serverClientId:
          '528855485063-mjhi0vng1k0nqob5879j5nnstc93g9tb.apps.googleusercontent.com',
    );
  }

  setupLocator();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(
            loginUsecase: getIt<LoginUsecase>(),
            signWithGoogleUsecase: getIt.get<SignWithGoogleUsecase>(),
            signWithFacebook: getIt.get<SignWithFacebook>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar', ''), // Arabic
        ],
        locale: Locale('ar', ''), // Arabic

        theme: ThemeData(
          fontFamily: 'Cairo',
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          useMaterial3: true,
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
