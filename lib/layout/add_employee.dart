import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tp_agile/data/worker_data.dart';
import 'package:tp_agile/model/workers_model.dart';

const List<String> teams = <String>['Carton', 'Client', 'Scotch'];

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController startdateController = TextEditingController();
  TextEditingController wagesController = TextEditingController();
  TextEditingController workingdaysController = TextEditingController();
  String dropdownValue = teams.first;

  Worker worker = Worker(
    firstname: '',
    name: '',
    startdate: '',
    wages: '',
    workingdays: [],
    team: '',
  );

  @override
  void dispose() {
    firstnameController.dispose();
    nameController.dispose();
    startdateController.dispose();
    wagesController.dispose();
    workingdaysController.dispose();
    super.dispose();
  }

  // void initState() {
  //   firstnameController.text = 'Robin';
  //   nameController.text = 'MJ';
  //   startdateController.text = '01-01-2022';
  //   wagesController.text = '150';
  //   workingdaysController.text = 'L,J,S';
  //   return super.initState();
  // }

  void validateData() {
    if (firstnameController.text.isEmpty ||
        nameController.text.isEmpty ||
        startdateController.text.isEmpty ||
        wagesController.text.isEmpty ||
        workingdaysController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez remplir tous les champs'),
        ),
      );
      return;
    }

    final RegExp dateRegex =
        RegExp(r'^(0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[012])-(19|20)\d\d$');

    if (dateRegex.hasMatch(startdateController.text) == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez entrer une date valide'),
        ),
      );
      return;
    }

    final RegExp workingDayRegex =
        RegExp(r'^(L|Ma|Me|J|V|S)(,(L|Ma|Me|J|V|S))*$');

    if (workingDayRegex.hasMatch(workingdaysController.text) == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez entrer les jours en suivant le format donné'),
        ),
      );
      return;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter un employé'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: firstnameController,
                decoration: const InputDecoration(
                  labelText: 'Prénom',
                ),
              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Nom',
                ),
              ),
              TextFormField(
                controller: startdateController,
                decoration: const InputDecoration(
                  labelText: 'Date d\'embauche (ex: jj-mm-aaaa)',
                ),
              ),
              TextFormField(
                controller: wagesController,
                decoration: const InputDecoration(
                  labelText: 'Salaire',
                ),
              ),
              TextFormField(
                controller: workingdaysController,
                decoration: const InputDecoration(
                  labelText: 'Jours travaillés (ex: L,Ma,Me,J,V,S))',
                ),
              ),
              Row(
                children: [
                  const Text('Équipe : '),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    underline: Container(
                      height: 2,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: teams.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  validateData();

                  List<String> workingDaysList =
                      workingdaysController.text.split(',');
                  worker.firstname = firstnameController.text;
                  worker.name = nameController.text;
                  worker.startdate = startdateController.text;
                  worker.wages = wagesController.text;
                  worker.workingdays = workingDaysList;
                  worker.team = dropdownValue;

                  workers.add(worker);

                  Navigator.pushNamed(context, '/employees');
                },
                child: const Text('Ajouter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
