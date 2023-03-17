import 'package:flutter/material.dart';
import 'package:tp_agile/data/worker_data.dart';

int getNumberOfWorkersOnDay(String day, String team) {
  return workers
      .where(
          (worker) => worker.workingdays.contains(day) && worker.team == team)
      .length;
}

Map planning = {
  'L': {
    'dayLong': 'Lundi',
    'Carton': {
      'actual': getNumberOfWorkersOnDay('L', 'Carton'),
      'desired': 3,
    },
    'Scotch': {
      'actual': getNumberOfWorkersOnDay('L', 'Scotch'),
      'desired': 2,
    },
    'Client': {
      'actual': getNumberOfWorkersOnDay('L', 'Client'),
      'desired': 0,
    },
  },
  'Ma': {
    'dayLong': 'Mardi',
    'Carton': {
      'actual': getNumberOfWorkersOnDay('Ma', 'Carton'),
      'desired': 3,
    },
    'Scotch': {
      'actual': getNumberOfWorkersOnDay('Ma', 'Scotch'),
      'desired': 3,
    },
    'Client': {
      'actual': getNumberOfWorkersOnDay('Ma', 'Client'),
      'desired': 1,
    },
  },
  'Me': {
    'dayLong': 'Mercredi',
    'Carton': {
      'actual': getNumberOfWorkersOnDay('Me', 'Carton'),
      'desired': 2,
    },
    'Scotch': {
      'actual': getNumberOfWorkersOnDay('Me', 'Scotch'),
      'desired': 2,
    },
    'Client': {
      'actual': getNumberOfWorkersOnDay('Me', 'Client'),
      'desired': 1,
    },
  },
  'J': {
    'dayLong': 'Jeudi',
    'Carton': {
      'actual': getNumberOfWorkersOnDay('J', 'Carton'),
      'desired': 1,
    },
    'Scotch': {
      'actual': getNumberOfWorkersOnDay('J', 'Scotch'),
      'desired': 3,
    },
    'Client': {
      'actual': getNumberOfWorkersOnDay('J', 'Client'),
      'desired': 0,
    },
  },
  'V': {
    'dayLong': 'Vendredi',
    'Carton': {
      'actual': getNumberOfWorkersOnDay('V', 'Carton'),
      'desired': 2,
    },
    'Scotch': {
      'actual': getNumberOfWorkersOnDay('V', 'Scotch'),
      'desired': 3,
    },
    'Client': {
      'actual': getNumberOfWorkersOnDay('V', 'Client'),
      'desired': 2,
    },
  },
  'S': {
    'dayLong': 'Samedi',
    'Carton': {
      'actual': getNumberOfWorkersOnDay('S', 'Carton'),
      'desired': 1,
    },
    'Scotch': {
      'actual': getNumberOfWorkersOnDay('S', 'Scotch'),
      'desired': 3,
    },
    'Client': {
      'actual': getNumberOfWorkersOnDay('S', 'Client'),
      'desired': 2,
    },
  },
};

class Planning extends StatelessWidget {
  const Planning({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffeb701),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: ListView.builder(
            itemCount: planning.length,
            itemBuilder: (context, index) {
              final dayShort = planning.keys.elementAt(index);
              final numberByTeam = planning[dayShort];
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
                    child: Text(
                      planning[dayShort]['dayLong'],
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(100.0, 0, 100.0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Carton : ${numberByTeam['Carton']['actual']} / ${numberByTeam['Carton']['desired']}',
                          style: const TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(100.0, 0, 100.0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Scotch : ${numberByTeam['Scotch']['actual']} / ${numberByTeam['Scotch']['desired']}',
                          style: const TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        Visibility(
                          visible: showButton(numberByTeam),
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: const Color(0xfffeb701),
                            ),
                            child: IconButton(
                              onPressed: () => {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Voulez vous recruter un nouveau membre pour ${planning[dayShort]['dayLong']} ?'),
                                  ),
                                ),
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(100.0, 0, 100.0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Client : ${numberByTeam['Client']['actual']} / ${numberByTeam['Client']['desired']}',
                          style: const TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  showButton(numberByTeam) {
    return numberByTeam['Carton']['actual'] <
            numberByTeam['Carton']['desired'] ||
        numberByTeam['Scotch']['actual'] < numberByTeam['Scotch']['desired'] ||
        numberByTeam['Client']['actual'] < numberByTeam['Client']['desired'];
  }
}
