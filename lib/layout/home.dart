import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static String routeName = '/';

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(width: 200, height: 0),
                    Column(children: const [
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(children: const [
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
                    const SizedBox(width: 200, height: 0),
                  ],
                ),
                // TROISIEME TEXT
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(width: 100, height: 0),
                    Column(children: const [
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(children: const [
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
                    const SizedBox(width: 200, height: 0),
                  ],
                ),
                // CINQUIEME TEXT
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(width: 200, height: 0),
                    Column(children: const [
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Image(
                        image: AssetImage('lib/img/livreur.png'),
                        width: 200,
                        height: 200),
                    Column(children: const [
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
            ],
          )
        ],
      )),
    );
  }
}
