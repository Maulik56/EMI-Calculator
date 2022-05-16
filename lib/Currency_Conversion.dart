import 'package:flutter/material.dart';

class CurrencyConversion extends StatelessWidget {
  const CurrencyConversion({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff324367),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              Container(
                height: 450,
                width: 340,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Principle Amount *',
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
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              height: 100,
                              child: Column(
                                children: [
                                  Text(
                                    'From',
                                    style: TextStyle(
                                        color: Color(0xff324367),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color(0xff324367),
                                              spreadRadius: 0.5,
                                              blurRadius: 1)
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 100,
                              child: Column(
                                children: [
                                  Text(
                                    'To',
                                    style: TextStyle(
                                        color: Color(0xff324367),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 130,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color(0xff324367),
                                              spreadRadius: 0.5,
                                              blurRadius: 1)
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: FlatButton(
                          onPressed: () {},
                          child: Container(
                            height: 40,
                            width: 90,
                            decoration: BoxDecoration(
                                color: Color(0xff324367),
                                borderRadius: BorderRadius.circular(15),
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
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: Color(0xff324367),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
