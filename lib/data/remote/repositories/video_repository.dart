import 'package:deepface_test/data/remote/data_sources/api_service.dart';

class VideoRepository {
  final ApiService _apiService;

  VideoRepository(this._apiService);

  Future<void> sendVideo(String videoPath, double startTime, double endTime) async {
    await _apiService.sendVideo(videoPath, startTime, endTime);
  }
}
