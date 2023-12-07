import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';


class actuCard extends StatelessWidget {
  actuCard(
      {super.key,
      required this.title,
      required this.description,
      required this.urlToImage});
  String urlToImage, title, description;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 0.8,
                    child: Image.asset(
                      urlToImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Opacity(
                    opacity: 0.6,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 2,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white70,
                      ),
                      child: const AutoSizeText(
                        "19-03-2000",
                        presetFontSizes: [12, 11, 10],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    title,
                    presetFontSizes: [16, 5, 14, 13],
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.9),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(height: 10),
                  AutoSizeText(
                    description,
                    presetFontSizes: [14, 13, 12],
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(height: 5),
                  _buildBottom()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottom() {
    IconData icon = Icons.keyboard_arrow_down;
    return Padding(
      padding: const EdgeInsets.only(
        top: 5,
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Divider(
                height: 1,
                color: Colors.grey.shade400,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            child: AutoSizeText(
              "Cliquez pour lire",
              presetFontSizes: const [11, 10, 9],
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Divider(
                height: 1,
                color: Colors.grey.shade400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}