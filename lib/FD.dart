import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FD extends StatefulWidget {
  const FD({Key key}) : super(key: key);

  @override
  _FDState createState() => _FDState();
}

class _FDState extends State<FD> {
  List TenureType = ['Month(s)', 'Year'];
  String tenureType = "Year";
  String _totalinterestvalue = "";
  String _maturityvalue = "";
  String PrincipalAmount1 = "";
  // double percentage = 0;

  // double TotalInterestPercentage = 0;
  // double TotalPrincipalPercentage = 0;
  // double InterestAmount = 0;
  // double PrincipalAmount = 0;

  TextEditingController PrincipalAmount = TextEditingController();
  final TextEditingController interestRate = TextEditingController();
  final TextEditingController tenure = TextEditingController();

  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff324367),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 450,
                    width: 340,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Amount of Deposit*',
                            style: TextStyle(
                                color: Color(0xff324367),
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            width: 310,
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xff324367),
                                      spreadRadius: 0.5,
                                      blurRadius: 1)
                                ]),
                            child: TextField(
                              controller: PrincipalAmount,
                              cursorColor: Color(0xff324367),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text(
                                'Interest Rate *',
                                style: TextStyle(
                                    color: Color(0xff324367),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                '(max: 50% per annum)',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            width: 310,
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xff324367),
                                      spreadRadius: 0.5,
                                      blurRadius: 1)
                                ]),
                            child: TextField(
                              controller: interestRate,
                              cursorColor: Color(0xff324367),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text(
                                'Tenure *',
                                style: TextStyle(
                                    color: Color(0xff324367),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                '(max: 30 yr)',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Column(
                                children: [
                                  Text(tenureType,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Switch(
                                      activeColor: Color(0xff324367),
                                      value: switchValue,
                                      onChanged: (bool value) {
                                        print(value);

                                        if (value) {
                                          TenureType = TenureType[1];
                                        } else {
                                          TenureType = TenureType[0];
                                        }

                                        setState(() {
                                          switchValue = value;
                                        });
                                      })
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            width: 310,
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xff324367),
                                      spreadRadius: 0.5,
                                      blurRadius: 1)
                                ]),
                            child: TextField(
                              controller: tenure,
                              cursorColor: Color(0xff324367),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Divider(
                            color: Color(0xff324367),
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 40,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xff324367),
                                          spreadRadius: 0.5,
                                          blurRadius: 1)
                                    ]),
                                child: Center(
                                  child: Text(
                                    'Reset',
                                    style: TextStyle(
                                        color: Color(0xff324367),
                                        fontSize: 17,
                                        letterSpacing: 1),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FlatButton(
                                onPressed: _handleCalculation,
                                child: Container(
                                  height: 40,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      color: Color(0xff324367),
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0xff324367),
                                            spreadRadius: 0.5,
                                            blurRadius: 1)
                                      ]),
                                  child: Center(
                                    child: Text(
                                      'Calculate',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          letterSpacing: 0.5),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                totalinterestvalue(_totalinterestvalue),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleCalculation() {
    // Amortization
    // A = Payment amount per period
    // P = Initial Principal
    // r = interest rate
    // n = total number of payments or periods
    // B = Total Payment

    double A = 0.0;
    double B = 0.0;
    double I = 0;

    int P = int.parse(PrincipalAmount.text);
    double r = double.parse(interestRate.text);
    double n = TenureType == "Year"
        ? double.parse(tenure.text)
        : double.parse(tenure.text) / 12;

    I = (P * r) / 100;

    A = I * n;
    B = P + A;

    print('$P');
    print('$r');
    print('$I');

    _totalinterestvalue = A.toStringAsFixed(2);
    _maturityvalue = B.toStringAsFixed(2);
    PrincipalAmount1 = P.toStringAsFixed(2);

    setState(() {});
  }

  // ignore: missing_return
  Widget totalinterestvalue(emiResult) {
    bool canShow = false;

    if (_totalinterestvalue.length > 0) {
      canShow = true;
    }
    // return Container(
    //     margin: EdgeInsets.only(top: 40.0),
    //     child: canShow
    //         ? Column(children: [
    //             Text("Your Monthly EMI is",
    //                 style:
    //                     TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
    //             Container(
    //                 child: Text(emiResult,
    //                     style: TextStyle(
    //                         fontSize: 50.0, fontWeight: FontWeight.bold)))
    //           ])
    //         : Container());

    return Container(
        height: 400,
        width: 340,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: canShow
            ? Column(
                children: [
                  Container(
                    height: 85,
                    child: Column(
                      children: [
                        Text(
                          'Investment Amount',
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 1,
                            color: Color(0xff324367),
                          ),
                        ),
                        Text(
                          PrincipalAmount1,
                          style: TextStyle(
                              color: Color(0xff324367),
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Color(0xff324367),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          'Total Interest Value',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff324367),
                          ),
                        ),
                        Text(
                          _totalinterestvalue,
                          style: TextStyle(
                              color: Color(0xff324367),
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Color(0xff324367),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          'Maturity Value',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff324367),
                          ),
                        ),
                        Text(
                          _maturityvalue,
                          style: TextStyle(
                              color: Color(0xff324367),
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Container(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              'Investment Amount',
                              style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 1,
                                color: Color(0xff324367),
                              ),
                            ),
                            Text(
                              PrincipalAmount1,
                              style: TextStyle(
                                  color: Color(0xff324367),
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Color(0xff324367),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              'Total Interest Value',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff324367),
                              ),
                            ),
                            Text(
                              _totalinterestvalue,
                              style: TextStyle(
                                  color: Color(0xff324367),
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Color(0xff324367),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              'Maturity Value',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff324367),
                              ),
                            ),
                            Text(
                              _maturityvalue,
                              style: TextStyle(
                                  color: Color(0xff324367),
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ));
  }
}
