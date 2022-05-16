// import "dart:math";
//
// import "package:flutter/material.dart";
//
// void main() => runApp(MaterialApp(
//     title: 'EMI Calc',
//     theme: ThemeData(
//       primaryColor: Colors.redAccent,
//       accentColor: Colors.redAccent,
//     ),
//     home: HomeScreen()));
//
// class HomeScreen extends StatefulWidget {
//   @override
//   HomeScreenState createState() => HomeScreenState();
// }
//
// class HomeScreenState extends State<HomeScreen> {
//   List TenureType = ['Month(s)', 'Year(s)'];
//   String TenureType = "Year(s)";
//   String emiResult = "";
//
//   final TextEditingController PrincipalAmount = TextEditingController();
//   final TextEditingController interestRate = TextEditingController();
//   final TextEditingController tenure = TextEditingController();
//
//   bool switchValue = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text("EMI Calculator"), elevation: 0.0),
//         body: Center(
//             child: Container(
//                 child: Column(
//           children: <Widget>[
//             Container(
//                 padding: EdgeInsets.all(20.0),
//                 child: TextField(
//                   controller: PrincipalAmount,
//                   decoration:
//                       InputDecoration(labelText: "Enter Principal Amount"),
//                   keyboardType: TextInputType.number,
//                 )),
//             Container(
//                 padding: EdgeInsets.all(20.0),
//                 child: TextField(
//                   controller: interestRate,
//                   decoration: InputDecoration(labelText: "Interest Rate"),
//                   keyboardType: TextInputType.number,
//                 )),
//             Container(
//                 padding: EdgeInsets.all(20.0),
//                 child: Row(
//                   children: <Widget>[
//                     Flexible(
//                         flex: 4,
//                         fit: FlexFit.tight,
//                         child: TextField(
//                           controller: tenure,
//                           decoration: InputDecoration(labelText: "Tenure"),
//                           keyboardType: TextInputType.number,
//                         )),
//                     Flexible(
//                         flex: 1,
//                         child: Column(children: [
//                           Text(TenureType,
//                               style: TextStyle(fontWeight: FontWeight.bold)),
//                           Switch(
//                               value: switchValue,
//                               onChanged: (bool value) {
//                                 print(value);
//
//                                 if (value) {
//                                   TenureType = TenureType[1];
//                                 } else {
//                                   TenureType = TenureType[0];
//                                 }
//
//                                 setState(() {
//                                   switchValue = value;
//                                 });
//                               })
//                         ]))
//                   ],
//                 )),
//             Flexible(
//                 fit: FlexFit.loose,
//                 child: FlatButton(
//                     onPressed: _handleCalculation,
//                     child: Text("Calculate"),
//                     color: Colors.redAccent,
//                     textColor: Colors.white,
//                     padding: EdgeInsets.only(
//                         top: 10.0, bottom: 10.0, left: 24.0, right: 24.0))),
//             emiResultsWidget(emiResult)
//           ],
//         ))));
//   }
//
//   void _handleCalculation() {
//     //  Amortization
//     //  A = Payemtn amount per period
//     //  P = Initial Printical (loan amount)
//     //  r = interest rate
//     //  n = total number of payments or periods
//
//     double A = 0.0;
//     int P = int.parse(PrincipalAmount.text);
//     double r = int.parse(interestRate.text) / 12 / 100;
//     int n = TenureType == "Year(s)"
//         ? int.parse(tenure.text) * 12
//         : int.parse(tenure.text);
//
//     A = (P * r * pow((1 + r), n) / (pow((1 + r), n) - 1));
//
//     emiResult = A.toStringAsFixed(2);
//
//     setState(() {});
//   }
//
//   Widget emiResultsWidget(emiResult) {
//     bool canShow = false;
//     String emiResult = emiResult;
//
//     if (emiResult.length > 0) {
//       canShow = true;
//     }
//     return Container(
//         margin: EdgeInsets.only(top: 40.0),
//         child: canShow
//             ? Column(children: [
//                 Text("Your Monthly EMI is",
//                     style:
//                         TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
//                 Container(
//                     child: Text(emiResult,
//                         style: TextStyle(
//                             fontSize: 50.0, fontWeight: FontWeight.bold)))
//               ])
//             : Container());
//   }
// }
