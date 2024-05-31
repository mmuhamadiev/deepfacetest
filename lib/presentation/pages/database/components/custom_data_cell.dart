import 'package:deepface_test/config/constants/app_text_styles.dart';
import 'package:deepface_test/presentation/pages/database/components/status_dialog.dart';
import 'package:flutter/material.dart';

class CustomDataCell extends StatefulWidget {
  const CustomDataCell(
      {required this.key, required this.docId, required this.cellName, required this.isEditable});

  final Key key;
  final String docId;
  final String cellName;
  final bool isEditable;

  @override
  State<CustomDataCell> createState() => _CustomDataCellState();
}

class _CustomDataCellState extends State<CustomDataCell> {
  Future<T?> chaneRowData<T>(BuildContext context, String docId, String hint) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return StatusDialog(docId: docId, hint: hint,);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: Padding(
            padding: EdgeInsets.only(left: 4.0),
            child: Text(
              '${widget.cellName}',
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.body14w4,
            ),
          ),
        ),
        widget.isEditable == true? IconButton(
          onPressed: () async {
              await chaneRowData(context, widget.docId, widget.cellName);
          },
          iconSize: 10,
          icon: Icon(Icons.edit),
        ): SizedBox.shrink(),
      ],
    );
  }
}
