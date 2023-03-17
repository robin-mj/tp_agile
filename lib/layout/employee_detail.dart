import 'package:flutter/material.dart';
import 'package:tp_agile/model/workers_model.dart';

const List<String> teams = <String>['Carton', 'Client', 'Scotch'];

class EmployeeDetails extends StatefulWidget {
  final Worker worker;

  const EmployeeDetails({Key? key, required this.worker}) : super(key: key);

  @override
  _EmployeeDetailsState createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  late final TextEditingController firstnameController;
  late final TextEditingController nameController;
  late final TextEditingController startdateController;
  late final TextEditingController wagesController;
  late final TextEditingController workingdaysController;
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    firstnameController = TextEditingController(text: widget.worker.firstname);
    nameController = TextEditingController(text: widget.worker.name);
    startdateController = TextEditingController(text: widget.worker.startdate);
    wagesController =
        TextEditingController(text: widget.worker.wages.toString());
    workingdaysController =
        TextEditingController(text: widget.worker.workingdays.join(', '));
    dropdownValue = widget.worker.team;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffeb701),
      appBar: AppBar(
        title: const Text('Modifier salarié'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 50.0, bottom: 35.0),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, // fond blanc pour le padding arrondi
                  borderRadius: BorderRadius.circular(10.0), // bords arrondis
                ),
                child: Padding(
                  padding: EdgeInsets.all(25.0),
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
                            items: teams
                                .map<DropdownMenuItem<String>>((String value) {
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
                          // validateData();

                          // List<String> workingDaysList =
                          //     workingdaysController.text.split(',');
                          // worker.firstname = firstnameController.text;
                          // worker.name = nameController.text;
                          // worker.startdate = startdateController.text;
                          // worker.wages = wagesController.text;
                          // worker.workingdays = workingDaysList;
                          // worker.team = dropdownValue;

                          // workers.add(worker);

                          Navigator.pushNamed(context, '/employees');
                        },
                        child: const Text('Modifier'),
                      ),

                      // Text('${worker.firstname} ${worker.name}'),
                      // Text('Date d\'embauche : ${worker.startdate}'),
                      // Text('Salaire : ${worker.wages}€'),
                      // Text('Jours travaillés : ${worker.workingdays.join(', ')}'),
                      // Text('Équipe : ${worker.team}'),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
