import 'dart:core';
import 'package:emi_calc/Utility/handleCalculation.dart';
import 'package:flutter/material.dart';

class Statics extends StatefulWidget {
  @override
  State<Statics> createState() => _StaticsState();
}

class _StaticsState extends State<Statics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: DataTable(
            headingTextStyle: TextStyle(color: Colors.white),
            dividerThickness: 5,
            columnSpacing: MediaQuery.of(context).size.width * 0.15,
            showBottomBorder: true,
            headingRowColor:
                MaterialStateColor.resolveWith((states) => Color(0xff324367)),
            border: TableBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            columns: [
              DataColumn(
                label: Text('Month'),
              ),
              DataColumn(
                label: Text('EMI'),
              ),
              DataColumn(
                label: Text('Principal'),
              ),
              DataColumn(
                label: Text('Interest'),
              ),
              // DataColumn(
              //   label: Text('Balance'),
              // ),
            ],
            rows:
                payments // Loops through dataColumnText, each iteration assigning the value to element
                    .map(
                      ((element) => DataRow(
                            color: MaterialStateColor.resolveWith(
                                (states) => Colors.cyan[50]),
                            cells: <DataCell>[
                              DataCell(
                                Text(
                                    '${(element['Month']).toStringAsFixed(0)}'),
                              ),
                              DataCell(
                                Text('${(element['EMI']).toStringAsFixed(0)}'),
                              ), //Extracting from Map element the value
                              DataCell(
                                Text(
                                    '${(element['PrincipleAmountPerMonth']).toStringAsFixed(0)}'),
                              ),
                              DataCell(
                                Text(
                                    '${(element['InterestAmountPerMonth']).toStringAsFixed(0)}'),
                              ),
                              // DataCell(
                              //   Text('${element['Balance']}'),
                              // ),
                            ],
                          )),
                    )
                    .toList(),
          ),
        ),
      ),
    );
  }
}

// void Static() {
//
//   double Tenure = 0.0;
//   double EMI = 0.0;
//   double Principle = 0.0;
//   double Interest = 0.0;
//
//
//
//
//
//   final Iterable<Map<double, num>> payments =
//       List<int>.generate(60, (int index) => index + 1)
//           .map((int per) => <double, num>{
//                 Tenure : per,
//                 EMI: Finance.pmt(rate: 0.08 / 12, nper: 5 * 12, pv: 200000),
//                 Principle: Finance.ppmt(
//                     rate: (0.08 / 12), per: per, nper: 5 * 12, pv: 200000),
//                 Interest : Finance.ipmt(
//                     rate: (0.08 / 12), per: per, nper: 5 * 12, pv: 200000),
//               });
//
//   payments.forEach(print);
//
//   final num interestPaid =
//       payments.fold(0, (num p, Map<double, num> c) => p + c[Interest]);
//   print(interestPaid);
// }
