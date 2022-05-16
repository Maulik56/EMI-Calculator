import 'package:emi_calc/Utility/handleCalculation.dart';
import 'package:emi_calc/Utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'Statics.dart';

class EMI extends StatefulWidget {
  const EMI({Key key}) : super(key: key);

  @override
  _EMIState createState() => _EMIState();
}

class _EMIState extends State<EMI> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff324367),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 450,
                    width: screenSize.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          inputForm(
                              'Principle Amt', principalAmount, 'i.e. 100000'),
                          SizedBox(
                            height: 15,
                          ),
                          inputForm('Interest Rate', interestRate, 'i.e 8.5%'),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text(
                                'Loan Tenure *',
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
                                  Text(TenureTypes,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Switch(
                                      activeColor: Color(0xff324367),
                                      value: switchValue,
                                      onChanged: (bool value) {
                                        print(value);

                                        if (value) {
                                          TenureTypes = TenureType[1];
                                        } else {
                                          TenureTypes = TenureType[0];
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
                              GestureDetector(
                                onTap: () {
                                  principalAmount.clear();
                                  tenure.clear();
                                  interestRate.clear();
                                },
                                child: Container(
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
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Statics(),
                                    ),
                                  );
                                },
                                child: Container(
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
                                      'Statics',
                                      style: TextStyle(
                                          color: Color(0xff324367),
                                          fontSize: 17,
                                          letterSpacing: 1),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(),
                              GestureDetector(
                                onTap: () {
                                  handleCalculation();
                                  print('okk');
                                },
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
                emiResultsWidget(emiResult),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ignore: missing_return
  Widget emiResultsWidget(emiResult) {
    bool canShow = false;

    if (emiResult.length > 0) {
      canShow = true;
    }

    return Container(
        height: 400,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: canShow
            ? Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 180,
                        width: 180,
                        child: CircularPercentIndicator(
                          radius: 100,
                          progressColor: Color(0xff324367),
                          percent: percentage,
                          lineWidth: 6,
                          animation: true,
                          animationDuration: 1200,
                          circularStrokeCap: CircularStrokeCap.butt,
                          center: Text('$TotalInterestPercentage'),
                          footer: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Column(
                              children: [
                                Text(
                                  'Total Interest Payable',
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '$InterestAmount',
                                  style: TextStyle(
                                      color: Color(0xff324367),
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 180,
                        width: 160,
                        child: CircularPercentIndicator(
                          radius: 100,
                          progressColor: Color(0xff324367),
                          percent: PrincipalPercentage,
                          lineWidth: 6,
                          animation: true,
                          animationDuration: 1200,
                          circularStrokeCap: CircularStrokeCap.butt,
                          center: Text('$TotalPrincipalPercentage'),
                          footer: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Column(
                              children: [
                                Text(
                                  'Total Principal',
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '$PrincipalAmount',
                                  style: TextStyle(
                                      color: Color(0xff324367),
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Color(0xff324367),
                  ),
                  Container(
                    height: 85,
                    child: Column(
                      children: [
                        Text(
                          'Total Payment',
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 1,
                            color: Color(0xff324367),
                          ),
                        ),
                        Text(
                          '(Principal+Interest)',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff324367),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          totalPayment,
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
                          'EMI',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff324367),
                          ),
                        ),
                        Text(
                          '(Monthly Payment)',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff324367),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          emiResult,
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
                height: 400,
                width: 340,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 180,
                          width: 180,
                          child: CircularPercentIndicator(
                            radius: 100,
                            progressColor: Color(0xff324367),
                            percent: percentage,
                            lineWidth: 6,
                            animation: true,
                            animationDuration: 1200,
                            circularStrokeCap: CircularStrokeCap.butt,
                            center: Text('$TotalInterestPercentage'),
                            footer: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Column(
                                children: [
                                  Text(
                                    'Total Interest Payable',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '$InterestAmount',
                                    style: TextStyle(
                                        color: Color(0xff324367),
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 180,
                          width: 160,
                          child: CircularPercentIndicator(
                            radius: 100,
                            progressColor: Color(0xff324367),
                            percent: PrincipalPercentage,
                            lineWidth: 6,
                            animation: true,
                            animationDuration: 1200,
                            circularStrokeCap: CircularStrokeCap.butt,
                            center: Text('$TotalPrincipalPercentage'),
                            footer: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Column(
                                children: [
                                  Text(
                                    'Total Principal',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '$PrincipalAmount',
                                    style: TextStyle(
                                        color: Color(0xff324367),
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: Color(0xff324367),
                    ),
                    Container(
                      height: 85,
                      child: Column(
                        children: [
                          Text(
                            'Total Payment',
                            style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 1,
                              color: Color(0xff324367),
                            ),
                          ),
                          Text(
                            '(Principal+Interest)',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff324367),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            totalPayment,
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
                            'EMI',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xff324367),
                            ),
                          ),
                          Text(
                            '(Monthly Payment)',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff324367),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            emiResult,
                            style: TextStyle(
                                color: Color(0xff324367),
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
  }
}
