part of 'video_cubit.dart';

abstract class VideoState {}

class VideoInitial extends VideoState {}

class VideoLoading extends VideoState {}

class VideoSuccess extends VideoState {}

class VideoFailure extends VideoState {
  final String error;

  VideoFailure(this.error);
}