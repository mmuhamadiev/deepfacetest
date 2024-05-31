import 'package:deepface_test/config/constants/app_text_styles.dart';
import 'package:deepface_test/config/constants/strings.dart';
import 'package:deepface_test/presentation/manager/firebase_cubit/firebase_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class StatusDialog extends StatefulWidget {
  const StatusDialog({super.key, required this.docId, required this.hint});
  final String docId;
  final String hint;

  @override
  State<StatusDialog> createState() => _StatusDialogState();
}

class _StatusDialogState extends State<StatusDialog> {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Change status'),
      content: BlocListener<FirebaseCubit, FirebaseState>(
        listener: (context, state) {
          if(state is FirebaseUpdatedTaskState) {
            context.pop('done');
          }
        },
        child: SizedBox(
          height: 250.h,
            child: BlocBuilder<FirebaseCubit, FirebaseState>(
              builder: (context, state) {
                if(state is FirebaseLoadingTaskState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Column(
                  children: [
                    ...List.generate(status.length, (index) {
                      return ListTile(
                        onTap: () {
                          context.read<FirebaseCubit>().updateRacion(widget.docId, status[index]);
                        },
                        title: Text(status[index], style: AppTextStyles.body14w4,),
                        trailing: widget.hint == status[index]? Icon(Icons.check): null,
                      );
                    })
                  ],
                );
              }
            )
        ),
      ),
    );
  }
}
