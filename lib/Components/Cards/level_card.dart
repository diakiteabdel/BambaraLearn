import 'package:auto_size_text/auto_size_text.dart';
import 'package:bambara_learn/widgets/Circular_percent.dart';
import 'package:flutter/material.dart';


class levelCard extends StatefulWidget {
  String Titre;
  String description;
  double value;

  levelCard(
      {super.key,
      required this.Titre,
      required this.value,
      required this.description});

  @override
  State<levelCard> createState() => _levelCardState();
}

class _levelCardState extends State<levelCard> {
  TextStyle style = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    color: Colors.grey.shade900,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      clipBehavior: Clip.antiAlias,
      shadowColor: Colors.lightBlueAccent.shade100,
      color: Colors.transparent,
      elevation: 1.0,
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        //decoration: boxDecoration(radius: 5, bgColor: ),
        // padding: EdgeInsets.all(10),
        child: Container(
          /*decoration: boxDecoration(
              radius: 5, bgColor: const Color(0xff161d27).withOpacity(0.9)),*/
          padding: EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AutoSizeText(
                            widget.Titre,
                            presetFontSizes: [13, 12, 11],
                            maxLines: 1,
                            style: const TextStyle(
                              fontFamily: "Poppins",
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          AutoSizeText(
                            widget.description,
                            presetFontSizes: [11, 10, 9, 8],
                            maxLines: 2,
                            style: const TextStyle(
                              fontFamily: "Poppins",
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: CircularPercentIndicator(
                        radius: 18.0,
                        lineWidth: 3.0,
                        percent: widget.value / 100,
                        center: AutoSizeText(
                          widget.value.toStringAsFixed(1),
                          presetFontSizes: const [13, 12, 10, 9, 8],
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: style.copyWith(
                            color: Colors.black,
                            fontFamily: "Aller",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        progressColor: Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
              ]),
        ),
      ),
    );
  }
}