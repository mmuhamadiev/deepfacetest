import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deepface_test/config/constants/app_text_styles.dart';
import 'package:deepface_test/config/constants/strings.dart';
import 'package:deepface_test/presentation/manager/firebase_cubit/firebase_cubit.dart';
import 'package:deepface_test/presentation/pages/database/components/delete_row_btn.dart';
import 'package:deepface_test/presentation/pages/database/manager/table_cubit/table_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DatabasePage extends StatefulWidget {
  const DatabasePage({super.key});

  @override
  State<DatabasePage> createState() => _DatabasePageState();
}

class _DatabasePageState extends State<DatabasePage> {

  @override
  void initState() {
    context.read<TableCubit>().initializeTableColumn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus!.unfocus();
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance
                        .collection("task_database")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData) {
                        final documents = snapshot.data!.docs;

                        // Collect the rows data
                        final List<Map<String, String>> rows = documents.map((doc) {
                          String taskId = doc.data()['task_id'];
                          DateTime dateTime = doc.data()['created_at'].toDate();
                          String status = doc.data()['status'];

                          return {
                            'doc_id': doc.id,
                            'task_id': taskId,
                            'created_at': dateTime.toString(),
                            'status': status,
                          };
                        }).toList();

                        context.read<TableCubit>().addTableRowFirebase(rows);

                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: BlocBuilder<TableCubit, TableState>(
                                    builder: (context, state) {
                                      return DataTable(
                                        headingRowHeight: 25.h,
                                        dataRowMinHeight: 25.h,
                                        horizontalMargin: 4,
                                        columnSpacing: 4,
                                        headingRowColor: WidgetStateProperty.all(Theme.of(context).primaryColorLight,),
                                        dataRowColor: WidgetStateProperty.all(Theme.of(context).primaryColorLight.withOpacity(0.1)),
                                        headingTextStyle: AppTextStyles.body14w4,
                                        dataRowMaxHeight: 25.h,
                                        dataTextStyle: AppTextStyles.body12w4,
                                        border: TableBorder.all(width: 0.8),
                                        decoration: BoxDecoration(
                                            border: Border.all()
                                        ),
                                        columns: state.columns,
                                        // rows: addInitialRow(listTemplateRacion),
                                        rows: state.rows,
                                      );
                                    }
                                ),
                              ),
                              Column(
                                children: [
                                  ///Racion add column
                                  Container(
                                    height: 25.h,
                                    child: Text('${deletedTaskCounter(rows)} Deleted tasks'),
                                  ),
                                  ///Racion delete btn
                                  ...deleteRowBtn(context),
                                ],
                              )
                            ],
                          ),
                        );
                      } else if(snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString(), style: AppTextStyles.body14w4,),
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }

                    }
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 120,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<FirebaseCubit>().saveNewTask(Random().nextInt(100000).toString(), status[0]);
                    },
                    child: Icon(Icons.add),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String deletedTaskCounter(List<Map<String, String>> rows) {
    int totalDeleted = 0;
    rows.forEach((element) {
      if(element['status'] == 'deleted') {
        totalDeleted ++;
      }
    });
    return totalDeleted.toString();
  }
}
