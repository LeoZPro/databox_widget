import 'package:flutter/material.dart';

class DataboxWidget extends StatelessWidget {
  final List<Databox> data;
  final bool isRow;

  const DataboxWidget({
    super.key,
    required this.data,
  }) : isRow = false;

  const DataboxWidget.row({
    super.key,
    required this.data,
    this.isRow = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: isRow ? _buildDataboxRow() : _buildDataboxColumn(),
        ),
      ),
    );
  }

  Widget _buildDataboxRow() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: data.map((item) {
        return _buildRowItem(item);
      }).toList(),
    );
  }

  Widget _buildRowItem(Databox? item) {
    if (item == null) return SizedBox();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              item.label,
              style: TextStyle(fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: 8),
          Flexible(
            child: Text(
              item.value,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataboxColumn() {
    return Table(
      columnWidths: {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(1),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.top,
      children: List.generate(
        (data.length / 2).ceil(),
        (index) {
          final left = data.length > index * 2 ? data[index * 2] : null;
          final right =
              data.length > index * 2 + 1 ? data[index * 2 + 1] : null;

          return TableRow(
            children: [
              _buildColumnItem(left),
              _buildColumnItem(right),
            ],
          );
        },
      ),
    );
  }

  Widget _buildColumnItem(Databox? item) {
    if (item == null) return SizedBox();

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.label,
            style: TextStyle(fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4),
          Text(
            item.value,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class Databox {
  final String label;
  final String value;

  Databox({required this.label, required this.value});
}
