// import 'package:bambara_learn/pages/HomePage.dart';
// import 'package:bambara_learn/pages/MotsExpression.dart';
// import 'package:bambara_learn/pages/historyPage.dart';
// import 'package:flutter/material.dart';

// class AppRouter {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case '/':
//         return MaterialPageRoute(builder: (_) => Homepage());
//       case '/history':
//         return MaterialPageRoute(builder: (_) => HistoryPage());
//       case '/precolonial':
//       //   return MaterialPageRoute(builder: (_) => HistorySubPage(title: 'Pré-coloniale'));
//       // case '/mots_expression':
//         return MaterialPageRoute(builder: (_) => MotsExpressionPage());
//       // Ajoutez d'autres routes au besoin
//       default:
//         return MaterialPageRoute(
//           builder: (_) => Scaffold(
//             body: Center(
//               child: Text('Aucune route définie pour ${settings.name}'),
//             ),
//           ),
//         );
//     }
//   }
// }