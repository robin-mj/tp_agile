import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 254, 183, 1),
        body: Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(width: 20, height: 850, color: Colors.black),
                  Column(children: [
                    // LOGO SUR FOND BLANC
                    Container(
                      width: 400,
                      height: 150,
                      margin: const EdgeInsets.only(top: 50, bottom: 20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: const Image(
                        image: AssetImage('lib/img/logo_S.png'),
                      ),
                    ),
                    // PREMIER TEXTE
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(width: 200, height: 0),
                        Column(children: [
                          Text("Chiffre d'affaire",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              )),
                          Text("306 800€",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ))
                        ])
                      ],
                    ),
                    // DEUXIEME TEXT
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(children: [
                          Text("7 Employés",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              )),
                          Text("3 Equipes",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ))
                        ]),
                        SizedBox(width: 200, height: 0),
                      ],
                    ),
                    // TROISIEME TEXT
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(width: 100, height: 0),
                        Column(children: [
                          Text("A votre",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              )),
                          Text("service",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ))
                        ])
                      ],
                    ),
                    // QUATRIEME TEXT
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(children: [
                          Text("Cartons renforcés",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                          Text("Pour une",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                          Text("efficacité maximum",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ))
                        ]),
                        SizedBox(width: 200, height: 0),
                      ],
                    ),
                    // CINQUIEME TEXT
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(width: 200, height: 0),
                        Column(children: [
                          Text("Adhésif",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              )),
                          Text("Repositionable",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              )),
                          Text("et recyclable",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ))
                        ])
                      ],
                    ),
                    const SizedBox(width: 10, height: 50),
                    // IMAGE ET DEVISE
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                            image: AssetImage('lib/img/livreur.png'),
                            width: 200,
                            height: 200),
                        Column(children: [
                          Text("Sur mesure",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              )),
                          Text("et avec",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              )),
                          Text("le sourir",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ))
                        ])
                      ],
                    ),
                  ]),
                  Container(
                      alignment: Alignment.topRight,
                      margin: const EdgeInsets.only(right: 20),
                      child: IconButton(
                        // ignore: avoid_print
                        onPressed: () => {print('Click settings')},
                        icon: const Icon(Icons.arrow_forward, size: 50),
                      )),
                  Container()
                ],
              )
            ],
          )),
        ));
  }
}
