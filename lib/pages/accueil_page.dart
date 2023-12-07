import 'package:bambara_learn/pages/page_viewer.dart';
import 'package:flutter/material.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  PageController _pageController = PageController(initialPage: 0);
  int _activedPage = 0;
  List<Widget>pages = [
     PageViewer(imgLink: "a",),
     PageViewer(pageColor: Colors.green,),
      PageViewer(imgLink: "assets/images/3974104.jpg",pageColor: Colors.grey,),
  ];
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(body: Stack(children: [
      PageView.builder(controller: _pageController,onPageChanged: (int page) {
        _activedPage = page;
      },itemCount: pages.length,itemBuilder: (context, index) {
        return pages[index];
      },)
    ],));
  }
  }






      /*
      debugShowCheckedModeBanner: false,
      title: 'Page de connexion',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'BambaraLearn'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        color: const Color(0xFFf7f8fc), // #f7f8fc
        child: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Construire le formulaire avec _formKey créé au-dessus
    Container(
      child: Image(image: AssetImage('assets/images/trur_7bl9_210621-removebg-preview.png'),
             width: 200,
             height: 200,
        
      ),
    );

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            maxLength: 25,
            decoration: const InputDecoration(
              labelText: 'Champ de formulaire',
              hintText: 'Entrer du texte',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez saisir un texte';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Traitement en cours')),
                  );
                }
              },
              child: Text('Envoyer'),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const AccueilPage());
}*/

