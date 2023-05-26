import 'package:flutter/material.dart';
import 'package:tp_agile/data/worker_data.dart';
import 'package:tp_agile/layout/employee_list.dart';
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

  bool dataIsValid() {
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
      return false;
    }

    final RegExp dateRegex =
        RegExp(r'^(0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[012])-(19|20)\d\d$');

    if (dateRegex.hasMatch(startdateController.text) == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez entrer une date valide'),
        ),
      );
      return false;
    }

    final RegExp workingDayRegex =
        RegExp(r'^(L|Ma|Me|J|V|S)(,(L|Ma|Me|J|V|S))*$');

    if (workingDayRegex.hasMatch(workingdaysController.text) == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez entrer les jours en suivant le format donné'),
        ),
      );
      return false;
    }

    return true;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffeb701),
      appBar: AppBar(
        title: const Text('Ajouter un employé'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: firstnameController,
                  decoration: const InputDecoration(
                    labelText: 'Prénom',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xfffeb701),
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nom',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xfffeb701),
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: startdateController,
                  decoration: const InputDecoration(
                    labelText: 'Date d\'embauche (ex: jj-mm-aaaa)',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xfffeb701),
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: wagesController,
                  decoration: const InputDecoration(
                    labelText: 'Salaire',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xfffeb701),
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: workingdaysController,
                  decoration: const InputDecoration(
                    labelText: 'Jours travaillés (ex: L,Ma,Me,J,V,S))',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xfffeb701),
                      ),
                    ),
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
                      items:
                          teams.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xfffeb701),
                  ),
                  onPressed: () {
                    if (dataIsValid()) {
                      List<String> workingDaysList =
                          workingdaysController.text.split(',');
                      worker.firstname = firstnameController.text;
                      worker.name = nameController.text;
                      worker.startdate = startdateController.text;
                      worker.wages = wagesController.text;
                      worker.workingdays = workingDaysList;
                      worker.team = dropdownValue;

                      workers.add(worker);

                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Ajouter'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
