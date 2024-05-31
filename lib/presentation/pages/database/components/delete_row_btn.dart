

import 'package:deepface_test/config/constants/app_text_styles.dart';
import 'package:deepface_test/presentation/pages/database/manager/table_cubit/table_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<Widget> deleteRowBtn(BuildContext context) {
  return List.generate(context.watch<TableCubit>().state.rows.length, (index) {
    if(0 == index) {
      return SizedBox(
        height: 25.h,
      );
    } else {
      return Container(
        width: 200,
        height: 25.h,
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          border: Border.all(width: 0.8, color: Colors.grey),
          borderRadius: BorderRadius.only(topRight: Radius.circular(20.r), bottomRight: Radius.circular(20.r)),
        ),
        child: InkWell(
          onTap: () {
            print(index);
            context.read<TableCubit>().deleteTableRow(index);
          },
          borderRadius: BorderRadius.only(topRight: Radius.circular(20.r), bottomRight: Radius.circular(20.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 150,
                height: 60.h,
                child: Center(
                  child: Text(
                    'Delete',
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    style: AppTextStyles.body14w4,
                  ),),
              ),
              Icon(Icons.delete_forever, size: 20, color: Colors.redAccent,),
            ],
          ),
        ),
      );
    }
  });
}