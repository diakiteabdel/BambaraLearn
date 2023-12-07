import 'package:flutter/material.dart';

class PageViewer extends StatefulWidget {
  
  PageViewer({super.key,this.imgLink = "assets/images/39049-removebg-preview.png",this.pageColor = Colors.white,title});
  String imgLink;
Color pageColor;
  @override
  State<PageViewer> createState() => _PageViewerState();
}

class _PageViewerState extends State<PageViewer> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: Column(
      children: [
        SizedBox(
            height: 10.0,
           ),
        Container(
          height: 200, 
          width: double.infinity, 
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.imgLink),
              fit: BoxFit.cover, // Ajustez le mode de redimensionnement de l'image
            ),
          ),
        ),
    
           //SizedBox(
           // height: 10.0,
           //),
        
        Expanded(
          child:Container(
          color: widget.pageColor,
          height: MediaQuery.of(context).size.height - 200,                                                                    // Ajustez la hauteur restante
          width: MediaQuery.of(context).size.width,
          //child: Column(
            // Ajoutez vos autres éléments ici
            child: Center(
              
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              width: 320, // Largeur du carré
              height: 300, // Hauteur du carré
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.green, // Couleur du carré
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey, // Couleur de l'ombre
                    spreadRadius: 6, // Écart de l'ombre
                    blurRadius: 6, // Flou de l'ombre
                    offset: Offset(1, 2), // Position de l'ombre (horizontale, verticale)
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Chapitre1: Premier pas',
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    '5/5 UNITES',
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'TERMINER !',
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Apprendre des expressions et\nregles simples de grammaire',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Traitement en cours')),
                      );
                    }
                  },
          
                                            style: ElevatedButton.styleFrom(
                                primary: Colors.white, 
                                onPrimary: Colors.green, 
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0), 
                                              ),
                                              minimumSize: Size(200,40),
                                            ),
          
                                     child: Text('REVISER',
                                     style: TextStyle(
                                      fontWeight: FontWeight.bold,fontSize: 25,
                                     ),
                                     ),
                  
                  ),
                ],
              ),
            ),
          ),
        ),
        ),
        ),
      ]
      ),
      ),
    );
  }
}
