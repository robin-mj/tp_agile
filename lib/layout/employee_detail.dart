import 'package:flutter/material.dart';
import 'package:tp_agile/model/workers_model.dart';

class EmployeeDetails extends StatelessWidget {
  final Worker worker;

  const EmployeeDetails({Key? key, required this.worker}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: const Text('Modifier salarié'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // fond blanc pour le padding arrondi
                borderRadius: BorderRadius.circular(20.0), // bords arrondis
              ),
              child: Column(
                children: [
                  Text('${worker.firstname} ${worker.name}'),
                  Text('Date d\'embauche : ${worker.startdate}'),
                  Text('Salaire : ${worker.wages}€'),
                  Text('Jours travaillés : ${worker.workingdays.join(', ')}'),
                  Text('Équipe : ${worker.team}'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}