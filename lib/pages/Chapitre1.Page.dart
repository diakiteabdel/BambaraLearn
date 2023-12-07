import 'package:bambara_learn/pages/Chap1Lecon1.dart';
import 'package:bambara_learn/pages/Chap1lecon2.dart';
import 'package:bambara_learn/pages/Chap1lecon3.dart';
import 'package:bambara_learn/pages/Chap3lecon2.dart';
import 'package:bambara_learn/pages/Chap1lecon5.dart';
import 'package:flutter/material.dart';

class Chapitre1page extends StatefulWidget {
  const Chapitre1page({Key? key}) : super(key: key);

  @override
  State<Chapitre1page> createState() => _Chapitre1pageState();
}

class _Chapitre1pageState extends State<Chapitre1page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.green,),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const Center(
                  child: Text(
                    'Chapitre1: Premier pas',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          const Text('Expression / Kumasen\n'),
          const Text('Grammaire /  daɲɛgafe-sɛbɛnni'),

          const SizedBox(
            height: 90,
          ),
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  Chap1lecon1()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  fixedSize: const Size(350, 50),
                  backgroundColor: Colors.green,
                   padding: EdgeInsets.symmetric(horizontal: 135, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Leçon 1',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
//------------------------------------------------------------------------------------
              const SizedBox(
                height: 20,
              ),
//------------------------------------------------------------------------------------
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Chap1lecon2()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  fixedSize: const Size(350, 50),
                  backgroundColor: Colors.yellow,
                   padding: EdgeInsets.symmetric(horizontal: 135, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Leçon 2',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Chap1lecon3()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  fixedSize: const Size(350, 50),
                  backgroundColor: Colors.red,
                   padding: EdgeInsets.symmetric(horizontal: 135, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Leçon 3',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
/*
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Chap1lecon4()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  fixedSize: const Size(350, 50),
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Leçon 4',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Chap1lecon5()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  fixedSize: const Size(350, 50),
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Leçon 5',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
*/
              const SizedBox(
                height: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}
