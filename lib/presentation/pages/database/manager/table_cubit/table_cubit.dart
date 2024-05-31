import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:deepface_test/config/constants/strings.dart';
import 'package:deepface_test/presentation/pages/database/components/custom_data_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'table_state.dart';

class TableCubit extends Cubit<TableState> {
  TableCubit() : super(TableInitial(
      [], []
  ));

  Future<void> initializeTableColumn() async{

    await Future.wait(listDataColumn.map((e) async{
      state.columns.add(e);
    }));

    emit(TableInitial(state.columns, state.rows));
  }

  void deleteTableRow(int index) {
    print((state.rows[index].cells.first.child as CustomDataCell).cellName);

    state.rows.removeAt(index);
    emit(TableInitial(state.columns, state.rows));
  }

  void addTableRowFirebase(List<Map<String, String>> rows) {
    rows.forEach((element) {
      bool result = state.rows.any((i) {
        var cellName = (i.cells[0].child as CustomDataCell).cellName;
        var status = (i.cells[2].child as CustomDataCell).cellName;

        if(cellName == element['task_id'] && status == element['status']) {
          return true;
        } else if(cellName == element['task_id'] && status != element['status']) {
          return false;
        } else {
          return false;
        }
      });

      if(result == false) {
        bool res = state.rows.any((i) {
          var cellName = (i.cells[0].child as CustomDataCell).cellName;
          var status = (i.cells[2].child as CustomDataCell).cellName;

          if(cellName == element['task_id'] && status != element['status']) {
            state.rows.remove(i);
            return true;
          } else {
            return false;
          }
        });
         List<DataCell> cells = List.generate(
             state.columns.length,
                 (index) {
               if(index == 0) {
                 return DataCell(
                     CustomDataCell(key: UniqueKey(), docId: element['doc_id']!, cellName: element['task_id']!, isEditable: false,)
                 );
               } else if(index == 1) {
                 return DataCell(
                     CustomDataCell(key: UniqueKey(), docId: element['doc_id']!, cellName: DateFormat('dd.MM.yyyy HH:mm').format(DateTime.parse(element['created_at']!)), isEditable: false,)
                 );
               } else {
                 return DataCell(
                     CustomDataCell(key: UniqueKey(), docId: element['doc_id']!, cellName: element['status']!, isEditable: true,)
                 );
               }
             }
         );
         state.rows.add(DataRow(cells: cells));

         emit(TableInitial(state.columns, state.rows));
       }
      });

  }


  void clean() {
    state.columns.clear();
    state.rows.clear();
    listDataColumn.clear();
    listDataColumn.add(DataColumn(
      tooltip: 'ID',
      label: Expanded(
          // alignment: Alignment.center,
          child: Text('ID', textAlign: TextAlign.center,),
      ),
    ),);
    listDataColumn.add(DataColumn(
      tooltip: 'Created at',
      label: Container(
          alignment: Alignment.center,
          child: Text('Created at', textAlign: TextAlign.center,),
      ),
    ),
    );
    listDataColumn.add(DataColumn(
      tooltip: 'Status',
      label: Container(
        width: 150,
        alignment: Alignment.center,
        child: Text('Status'),),),
    );
    initializeTableColumn();

    emit(TableInitial(state.columns, state.rows));
  }

}
