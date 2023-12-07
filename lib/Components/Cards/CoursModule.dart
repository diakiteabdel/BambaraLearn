import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CoursModuleCard extends StatefulWidget {
  //QuizCategory quizCat;
  const CoursModuleCard({
    super.key,
    //required this.quizCat
  });

  @override
  State<CoursModuleCard> createState() => _CoursModuleCardState();
}

class _CoursModuleCardState extends State<CoursModuleCard> {
  TextStyle style = const TextStyle(
    fontFamily: 'Poppins',
    color: Colors.white,
    fontWeight: FontWeight.w200,
    fontSize: 16,
  );
  TextStyle style2 = const TextStyle(fontFamily: "Aller", fontSize: 16.0);

  String getCatImage(String titre) {
    /*if (titre.toLowerCase().contains('concept')) {
      return 'assets/images/categories/3323359.png';
    } else if (titre.toLowerCase().contains('network') ||
        titre.toLowerCase().contains('réseau')) {
      return 'assets/images/categories/cloud.png';
    } else if (titre.toLowerCase().contains('sécurité')) {
      return 'assets/images/categories/security.png';
    } else if (titre.toLowerCase().contains('base de données')) {
      return 'assets/images/categories/db.png';
    } else if (titre.toLowerCase().contains('facturation')) {
      return "assets/images/categories/collections.png";
    } //Serve*/
    return "assets/images/diak.png";
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
        onTap: (() {}),
        child: FutureBuilder(
            future: FirebaseFirestore.instance.collection('cours').get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Erreur de recuperation');
              } else if (!snapshot.hasData) {
                return const Text("No cours pour l'instant");
              } else if (snapshot.hasData) {
                List<Map<String, dynamic>> coursList = [];
                for (var elm in snapshot.data!.docs) {
                  coursList.add(elm.data());
                  print(coursList);
                }
                return SizedBox(
                  height: 300,
                  child: ListView.builder(
                      itemCount: coursList.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> cours = coursList[index];
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          shadowColor: Colors.lightBlueAccent.shade100,
                          color: Colors.white,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          margin: const EdgeInsets.all(10),
                          child: SizedBox(
                            height: 150,
                            width: MediaQuery.of(context).size.width,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            AutoSizeText(
                                              cours['description'],
                                              presetFontSizes: const [
                                                12,
                                                11,
                                                10
                                              ],
                                              maxLines: 4,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontFamily: "Aller",
                                                color: Colors.black87,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5.0),
                                              child: AutoSizeText(
                                                cours['titre'],
                                                presetFontSizes: const [
                                                  13,
                                                  12,
                                                  11
                                                ],
                                                maxLines: 2,
                                                textAlign: TextAlign.justify,
                                                textDirection:
                                                    TextDirection.ltr,
                                                style: style.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.library_books,
                                                  color: Colors.green.shade400,
                                                  size: 12,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 5.0,
                                                      horizontal: 5),
                                                  child: AutoSizeText(
                                                    "10 Modules",
                                                    presetFontSizes: const [
                                                      11,
                                                      10,
                                                      9,
                                                      8,
                                                      7,
                                                      6
                                                    ],
                                                    maxLines: 1,
                                                    textAlign:
                                                        TextAlign.justify,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    style: style.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Colors.green.shade400,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Image.asset(
                                            getCatImage(""),
                                            height: 75,
                                            width: 75,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  right: -25,
                                  bottom: -75,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.green.withOpacity(0.15),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    width: 175,
                                    height: 175,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
      /*SPositioned(
        right: 0,
        top: 0,
        child: Transform.rotate(
          angle: math.pi / 4.0,
          child: Container(
            padding: EdgeInsets.all(2),
            constraints: const BoxConstraints(
              minWidth: 15,
              minHeight: 15,
            ),
            child: Image.asset(
              "assets/images/cachet/vip_7108023.png",
              height: 20,
              width: 20,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),*/
    ]);
  }
}
