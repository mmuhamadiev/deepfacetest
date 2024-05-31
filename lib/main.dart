import 'package:deepface_test/firebase_options.dart';
import 'package:deepface_test/presentation/manager/firebase_cubit/firebase_cubit.dart';
import 'package:deepface_test/presentation/manager/locator.dart';
import 'package:deepface_test/presentation/pages/database/manager/table_cubit/table_cubit.dart';
import 'package:deepface_test/presentation/pages/main/manager/main_cubit.dart';
import 'package:deepface_test/presentation/pages/video/manager/video_cubit.dart';
import 'package:deepface_test/presentation/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupConfiguration();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      splitScreenMode: true,
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getX.find<MainCubit>()),
          BlocProvider(create: (context) => getX.find<FirebaseCubit>()),
          BlocProvider(create: (context) => getX.find<TableCubit>()),
          BlocProvider(create: (context) => getX.find<VideoCubit>()),
        ],
        child: MaterialApp.router(
          title: 'DeppFace Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: router,
        ),
      ),
    );
  }
}