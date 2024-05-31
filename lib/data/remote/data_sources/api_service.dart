import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response> sendVideo(String videoPath, double startTime, double endTime) async {
    final String url = 'https://faceai-dev-55cf5949db95.herokuapp.com/ping?crop_params=$startTime:$endTime';
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(videoPath),
      });

      final response = await _dio.post(url, data: formData);
      return response;
  }
}
