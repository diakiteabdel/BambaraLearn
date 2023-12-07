import 'package:bambara_learn/pages/GeneralPage.dart';
import 'package:bambara_learn/pages/accueil_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bambara_learn/pages/connexion.Page.dart';

class PagePresentation extends StatefulWidget {
  const PagePresentation({Key? key}) : super(key: key);

  @override
  State<PagePresentation> createState() => _PagePresentationState();
}

class _PagePresentationState extends State<PagePresentation> {
  
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final _controller = PageController();

  int _currentIndex = 0;

    saveDejaOuverte() async {
    final SharedPreferences prefs = await _prefs; 
      prefs.setBool("dejaOuverte",true) ;
  }

  createCircle(int index) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 100),
        margin: EdgeInsets.only(right: 4),
        height: 5,
        width: _currentIndex == index ? 15 : 5, // current indicator is wider
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(3)));
  }

  bottomWidget() {
    return Container(
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           InkWell(
        onTap:() {
          if(_currentIndex>0){
             _controller.jumpToPage(_currentIndex-1);
          }
        
        },
         child:Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.grey.shade200),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.green,
              ),
            ),
          ),
          ),
       InkWell(
        onTap:() {
          if(_currentIndex<2){
             _controller.jumpToPage(_currentIndex+1);
          }
        
        },
         child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                   color: Colors.green.shade400),
              child:  Row(
          children: [Text("SUIVANT"),  SizedBox(width: 5,), Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                ] 
                ),
                ),
       ),
        ],
      ),
    );
  }

  srarButton(){
    return ElevatedButton(onPressed: () {  saveDejaOuverte();
    
    Navigator.of(context).pushAndRemoveUntil( MaterialPageRoute<void>(builder: (BuildContext context) => const GeneralPage()), (route) => false);
    }, child: Text("COMMENCER"),
       style: ElevatedButton.styleFrom(
        primary: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
        )
       ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                onPageChanged: (value) {
                  setState(() {
                    _currentIndex = value;
                  });
                },
                children: [
                  PagePresentation1(), // Page individuelle 1
                  PagePresentation2(), // Page individuelle 2
                  Page3(),
                ]),
          ),
        
              if(_currentIndex==2)...[
                srarButton()
              ] else ...[  Container(
              margin: const EdgeInsets.symmetric(vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) => createCircle(index)),
              ),),
                 bottomWidget(),
              ]
         
          // bottom buttons (not shown)
        ]),
      ),
    );
  }
}

class PagePresentation1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Text("Bambaralearn",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'kavoon',
            fontSize: 40,
            color: Colors.green,
            fontWeight: FontWeight.bold),
          ),

          ),

             Image(image: AssetImage('assets/images/logo.png'),
             width: 200,
             height: 200,
             ),
    
         
           
        //_buildPageWithCircle("LOGO", Colors.green),
        Text("Explorez, Apprenez,\n Épanouissez-vous : Le\n Monde du Bambara À Portée\n de Main",
        style: TextStyle(
          fontFamily: 'inter',
          fontSize: 20,
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
        )
      ],
    );
  }
}

class PagePresentation2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 10,
        ),
        //_buildPageWithCircle("2", Colors.blue),

        Image(image: AssetImage('assets/images/21095-transformed.jpg'),
             width: 200,
             height: 200,
             ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Text("Avec BambaraLearn ayez un\n véritable voyage au cœur de la\n culture malienne",
          style: TextStyle(
            fontFamily: 'inter',
            fontSize: 20,
            color: Colors.green,
            fontWeight: FontWeight.bold,
           ),
          ),
        ),
      ],
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text("Apprenez\n à tout moment\n et en tout lieux",
            style: TextStyle(
              fontFamily: 'inter',
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
        ),
        //_buildPageWithCircle("3", Colors.red),
        Image(image: AssetImage('assets/images/3974104.jpg'),
             width: 200,
             height: 200,
             ),
      ],
    );
  }
}

Widget _buildPageWithCircle(String text, Color circleColor) {
  return Container(
    color: Colors.white,
    child: Center(
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: circleColor,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}
