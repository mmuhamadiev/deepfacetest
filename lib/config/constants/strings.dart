import 'package:flutter/material.dart';

List<DataColumn> listDataColumn = [
  DataColumn(
    tooltip: 'ID',
    label: Expanded(
      // alignment: Alignment.center,
      child: Text('ID', textAlign: TextAlign.center,),
    ),
  ),
  DataColumn(
    tooltip: 'Created at',
    label: Container(
      alignment: Alignment.center,
      child: Text('Created at', textAlign: TextAlign.center,),
    ),
  ),
  DataColumn(
    tooltip: 'Status',
    label: Container(
      alignment: Alignment.center,
      child: Text('Status'),),),
];

List<String> status = [
  'in progress',
  'failed',
  'done',
  'deleted'
];