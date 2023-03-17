import 'package:flutter/material.dart';
import 'package:tp_agile/layout/employee_detail.dart';
import 'package:tp_agile/model/workers_model.dart';

class EmployeeListItem extends StatefulWidget {
  final Worker worker;

  const EmployeeListItem({Key? key, required this.worker}) : super(key: key);

  @override
  State<EmployeeListItem> createState() => _EmployeeListItemState();
}

class _EmployeeListItemState extends State<EmployeeListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EmployeeDetails(worker: widget.worker)));
      },
      child: Card(
        margin: EdgeInsets.all(5),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                '${widget.worker.firstname} ${widget.worker.name}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(widget.worker.team),
            ],
          ),
        ),
      ),
    );
  }
}
