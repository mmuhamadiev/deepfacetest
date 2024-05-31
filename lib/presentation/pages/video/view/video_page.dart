import 'dart:io';

import 'package:deepface_test/config/constants/app_text_styles.dart';
import 'package:deepface_test/presentation/pages/video/manager/video_cubit.dart';
import 'package:deepface_test/presentation/widgets/notifications/video_error.dart';
import 'package:deepface_test/presentation/widgets/notifications/video_limit_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_trimmer/video_trimmer.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {

  final Trimmer _trimmer = Trimmer();

  double _startValue = 0;
  double _endValue = 0;
  bool _isPlaying = false;
  bool _isVideoLoaded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _isVideoLoaded? Stack(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.5,
                    child: VideoViewer(trimmer: _trimmer, padding: const EdgeInsets.all(8.0),)),
                Positioned(
                  left: 20,
                  child: IconButton(
                    onPressed: () async{
                      if(_trimmer.currentVideoFile != null) {
                        _isVideoLoaded = false;
                        setState(() {

                        });
                      }
                  }, icon: Icon(Icons.delete_forever),),
                ),
              ],
            ): SizedBox.shrink(),
            _isVideoLoaded? Padding(
              padding: const EdgeInsets.all(8.0),
              child: TrimViewer(
                trimmer: _trimmer,
                viewerHeight: 50.0,
                viewerWidth: MediaQuery.of(context).size.width,
                maxVideoLength: const Duration(seconds: 120),
                onChangeStart: (value) => _startValue = value,
                onChangeEnd: (value) => _endValue = value,
                onChangePlaybackState: (value) =>
                    setState(() => _isPlaying = value),
              ),
            ): SizedBox.shrink(),
            _isVideoLoaded?
            BlocConsumer<VideoCubit, VideoState>(
                listener: (context, state) {
                  if(state is VideoFailure) {
                    showVideoErrorToast(context, state.error);
                  }
                },
                builder: (context, state) {
                  if(state is VideoLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ElevatedButton(onPressed: () async{
                    context.read<VideoCubit>().sendVideo(_trimmer.currentVideoFile!.path, _startValue, _endValue);
                }, child: Text('Continue'));
              }
            ): SizedBox.shrink(),
            Spacer(),
            ElevatedButton(onPressed: () async{
              XFile? video = await _imagePicked();

              if(video != null) {
                if(_trimmer.currentVideoFile != null) {
                  await _trimmer.loadVideo(videoFile: File(video.path));
                  _isVideoLoaded = true;
                  setState(() {

                  });
                } else {
                  await _trimmer.loadVideo(videoFile: File(video.path));
                  _isVideoLoaded = true;
                  setState(() {

                  });
                }

              }
              setState(() {

              });
            }, child: Text('Open photos')),
            SizedBox(
              height: 120,
            )
          ],
        ),
      ),
    );
  }

  Future<XFile?> _imagePicked() async {
    final ImagePicker picker = ImagePicker();
    final XFile? video = await picker.pickVideo(source: ImageSource.gallery);
    return video;
  }
}
