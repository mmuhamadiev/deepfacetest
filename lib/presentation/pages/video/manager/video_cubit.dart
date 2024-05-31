import 'package:bloc/bloc.dart';
import 'package:deepface_test/data/remote/repositories/video_repository.dart';
import 'package:meta/meta.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  final VideoRepository _videoRepository;

  VideoCubit(this._videoRepository) : super(VideoInitial());

  Future<void> sendVideo(String videoPath, double startTime, double endTime) async {
    emit(VideoLoading());

    try {
      await _videoRepository.sendVideo(videoPath, startTime, endTime);
      emit(VideoSuccess());
    } catch (e) {
      emit(VideoFailure(e.toString()));
    }
  }
}
