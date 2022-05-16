import 'dart:math';

import 'package:finance/finance.dart';
import 'package:flutter/material.dart';

List<dynamic> TenureType = <dynamic>['Month', 'Year'];
String TenureTypes = "Year";
String emiResult = "";
String totalPayment = "";
double percentage = 0;
double PrincipalPercentage = 0;

double TotalInterestPercentage = 0;
double TotalPrincipalPercentage = 0;
double InterestAmount = 0;
double PrincipalAmount = 0;

int n = (TenureTypes == "Year"
    ? int.parse(tenure.text) * 12
    : int.parse(tenure.text));

int P = int.parse(principalAmount.text);
double r = double.parse(interestRate.text) / 12 / 100;

TextEditingController principalAmount = TextEditingController();
TextEditingController interestRate = TextEditingController();
TextEditingController tenure = TextEditingController();

bool switchValue = true;

final Iterable<Map<String, num>> payments =
    List<int>.generate(n, (int index) => index + 1)
        .map((int per) => <String, num>{
              'Month': per,
              'EMI': Finance.pmt(rate: r, nper: n, pv: P),
              'PrincipleAmountPerMonth':
                  Finance.ppmt(rate: r, per: per, nper: n, pv: P),
              'InterestAmountPerMonth':
                  Finance.ipmt(rate: r, per: per, nper: n, pv: P),
              // 'Balance': P - Principle,
            })
        .toList();

void handleCalculation() {
  // Amortization
  // A = Payemtn amount per period
  // P = Initial Printical (loan amount)
  // r = interest rate
  // n = total number of payments or periods
  // B = Total Payment

  double A = 0.0;
  double B = 0.0;
  double I = 0.0;
  double IP = 0.0;
  double PP = 0.0;
  double PA = 0.0;
  // double Month = 0.0;
  // double EMI = 0.0;
  // double PrincipleAmountPerMonth = 0.0;
  // double InterestAmountPerMonth = 0.0;
  // double Balance = 0.0;

  A = (P * r * pow((1 + r), n) / (pow((1 + r), n) - 1));
  B = A * n;
  I = B - P;
  IP = ((I * 100) / B);
  PP = (P * 100) / B;
  PA = B - I;

  emiResult = A.toStringAsFixed(2);
  totalPayment = B.toStringAsFixed(2);

  percentage = IP / 100;
  PrincipalPercentage = PP / 100;
  TotalInterestPercentage = double.parse(IP.toStringAsFixed(2));
  TotalPrincipalPercentage = double.parse(PP.toStringAsFixed(2));
  InterestAmount = double.parse(I.toStringAsFixed(2));
  PrincipalAmount = PA;
}
