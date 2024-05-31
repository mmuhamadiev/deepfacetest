part of 'table_cubit.dart';


abstract class TableState {

  List<DataColumn> columns;

  List<DataRow> rows;

  TableState(this.columns, this.rows);
}

class TableInitial extends TableState {
  TableInitial(super.columns, super.rows);
}
