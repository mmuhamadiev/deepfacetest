import 'package:deepface_test/data/remote/data_sources/api_service.dart';
import 'package:deepface_test/data/remote/repositories/video_repository.dart';
import 'package:deepface_test/presentation/manager/firebase_cubit/firebase_cubit.dart';
import 'package:deepface_test/presentation/pages/database/manager/table_cubit/table_cubit.dart';
import 'package:deepface_test/presentation/pages/main/manager/main_cubit.dart';
import 'package:deepface_test/presentation/pages/video/manager/video_cubit.dart';
import 'package:logger/logger.dart';
import 'package:get/get.dart';

final getX = Get;
final logger = Logger(
  printer: PrettyPrinter(),
);

setupConfiguration() async {
  getX.put<ApiService>(ApiService());
  getX.put<VideoRepository>(VideoRepository(
      getX.find<ApiService>()
  ));

  getX.put<MainCubit>(MainCubit());
  getX.put<FirebaseCubit>(FirebaseCubit());
  getX.put<TableCubit>(TableCubit());
  getX.put<VideoCubit>(VideoCubit(
      getX.find<VideoRepository>()
  ));


}