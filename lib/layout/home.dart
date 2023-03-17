import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static String routeName = '/';
  static double fontsize = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(width: 20, height: 700, color: Colors.black),
                  Column(children: [
                    // LOGO SUR FOND BLANC
                    Container(
                      width: 370,
                      height: 130,
                      margin: const EdgeInsets.only(top: 20, bottom: 30),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                7, 7), // changes position of shadow
                          ),
                        ],
                      ),
                      child: const Image(
                        image: AssetImage('lib/img/logo_S.png'),
                      ),
                    ),
                    // PREMIER TEXTE
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(width: 200, height: 0),
                        Column(children: [
                          Text("Chiffre d'affaire",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fontsize,
                              )),
                          Text("306 800€",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fontsize,
                              ))
                        ])
                      ],
                    ),
                    // DEUXIEME TEXT
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(children: [
                          Text("7 Employés",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fontsize,
                              )),
                          Text("3 Equipes",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fontsize,
                              ))
                        ]),
                        const SizedBox(width: 160, height: 0),
                      ],
                    ),
                    // TROISIEME TEXT
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(width: 130, height: 0),
                        Column(children: [
                          Text("A votre",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fontsize,
                              )),
                          Text("service",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fontsize,
                              ))
                        ])
                      ],
                    ),
                    // QUATRIEME TEXT
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(children: [
                          Text("Cartons renforcés",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fontsize,
                              )),
                          Text("Pour une",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fontsize,
                              )),
                          Text("efficacité maximum",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fontsize,
                              ))
                        ]),
                        const SizedBox(width: 200, height: 0),
                      ],
                    ),
                    // CINQUIEME TEXT
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(width: 190, height: 0),
                        Column(children: [
                          Text("Adhésif",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fontsize,
                              )),
                          Text("Repositionable",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fontsize,
                              )),
                          Text("et recyclable",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fontsize,
                              ))
                        ])
                      ],
                    ),
                    const SizedBox(width: 10, height: 50),
                    // IMAGE ET DEVISE
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Image(
                            image: AssetImage('lib/img/livreur.png'),
                            width: 180,
                            height: 200),
                        Column(children: [
                          const Text("Sur mesure",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              )),
                          Text("et avec",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fontsize,
                              )),
                          const Text("le sourir",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ))
                        ])
                      ],
                    ),
                  ]),
                ],
              )
            ],
          )
        ],
      )),
    );
  }
}
