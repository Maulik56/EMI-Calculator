import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'EMI.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_applovin_max/flutter_applovin_max.dart';
import 'package:flutter_applovin_max/banner.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  String appUrl =
      "https://play.google.com/store/apps/details?id=com.zuloo.facebook_ads";
  String email = "zulooapps@gmail.com";
  String privacyPolicy =
      "https://zulooapps.blogspot.com/2022/04/privacy-policy.html";
  bool isInterstitialVideoAvailable = false;

  void listener(AppLovinAdListener event) {
    log("$event");
    if (event == AppLovinAdListener.onUserRewarded) {
      log('got reward');
    }
  }

  Future<bool> showWarning(BuildContext context) async => showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Do you want to exit the app?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text("NO"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text("YES"),
            ),
          ],
        );
      });

  @override
  void initState() {
    FlutterApplovinMax.initRewardAd('14fdae5ddf8ce698');
    FlutterApplovinMax.initInterstitialAd('a23c0f83593da36a');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showWarning(context);
        return shouldPop ?? false;
      },
      child: Scaffold(
        key: _globalKey,
        drawer: Align(
          alignment: Alignment.topLeft,
          child: SafeArea(
            child: Container(
              height: screenSize.height,
              width: 250,
              decoration: BoxDecoration(
                color: Color(0xff324367),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(color: Colors.white, blurRadius: 5),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.close_sharp,
                                size: 15,
                                color: Color(0xff324367),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.07,
                    ),
                    InkWell(
                      onTap: () {
                        Share.share(appUrl);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.share_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Share This App',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  letterSpacing: 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.07,
                    ),
                    InkWell(
                      onTap: () {
                        _launchInBrowser(Uri.parse(appUrl));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.info,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Rate This App',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  letterSpacing: 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.07,
                    ),
                    InkWell(
                      onTap: () {
                        _launchInBrowser(Uri.parse(appUrl));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.help,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Feedback / Report',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  letterSpacing: 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.07,
                    ),
                    InkWell(
                      onTap: () {
                        _launchInBrowser(Uri.parse(privacyPolicy));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.report,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Privacy Policy',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  letterSpacing: 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.07,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xff324367),
          title: Text(
            'Financial Calculator',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        bottomNavigationBar: BannerMaxView(
            (AppLovinAdListener event) => log("$event"),
            BannerAdSize.banner,
            "1c5b36fd2fd8b985"),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image(
                    height: 200,
                    image: AssetImage('assets/images/graph.png'),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'EMI Calculator',
                  style: TextStyle(
                      color: Color(0xff324367),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    isInterstitialVideoAvailable =
                        await FlutterApplovinMax.isInterstitialLoaded(listener);
                    if (isInterstitialVideoAvailable) {
                      FlutterApplovinMax.showInterstitialVideo(
                          (AppLovinAdListener event) => listener(event));
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EMI(),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 3,
                    color: Colors.white,
                    shadowColor: Color(0xff324367),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: 100,
                      height: 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(),
                          Container(
                            height: 90,
                            width: 75,
                            child: Column(
                              children: [
                                Center(
                                  child: Image(
                                    height: 40,
                                    image: AssetImage(
                                        'assets/images/calculator.png'),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'EMI',
                                  style: TextStyle(
                                      color: Color(0xff324367),
                                      letterSpacing: 1),
                                ),
                                Text(
                                  'Calculator',
                                  style: TextStyle(
                                    color: Color(0xff324367),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Banking Calculation',
                  style: TextStyle(
                      color: Color(0xff324367),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 3,
                  color: Colors.white,
                  shadowColor: Color(0xff324367),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    width: screenSize.width,
                    height: 110,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        GestureDetector(
                          onTap: () async {
                            isInterstitialVideoAvailable =
                                await FlutterApplovinMax.isInterstitialLoaded(
                                    listener);
                            if (isInterstitialVideoAvailable) {
                              FlutterApplovinMax.showInterstitialVideo(
                                  (AppLovinAdListener event) =>
                                      listener(event));
                            }
                            Fluttertoast.showToast(
                                msg: "Coming Soon...",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          },
                          child: Container(
                            height: 90,
                            width: 75,
                            child: Column(
                              children: [
                                Center(
                                  child: Image(
                                    height: 40,
                                    image: AssetImage(
                                        'assets/images/Currency1.png'),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Currency',
                                  style: TextStyle(
                                    color: Color(0xff324367),
                                  ),
                                ),
                                Text(
                                  'Conversion',
                                  style: TextStyle(
                                    color: Color(0xff324367),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(),
                        GestureDetector(
                          onTap: () async {
                            isInterstitialVideoAvailable =
                                await FlutterApplovinMax.isInterstitialLoaded(
                                    listener);
                            if (isInterstitialVideoAvailable) {
                              FlutterApplovinMax.showInterstitialVideo(
                                  (AppLovinAdListener event) =>
                                      listener(event));
                            }
                            Fluttertoast.showToast(
                                msg: "Coming Soon...",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          },
                          child: Container(
                            height: 90,
                            width: 75,
                            child: Column(
                              children: [
                                Center(
                                  child: Image(
                                    height: 40,
                                    image: AssetImage('assets/images/FD.png'),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'FD',
                                  style: TextStyle(
                                    color: Color(0xff324367),
                                  ),
                                ),
                                Text(
                                  'Calculator',
                                  style: TextStyle(
                                    color: Color(0xff324367),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(),
                        GestureDetector(
                          onTap: () async {
                            isInterstitialVideoAvailable =
                                await FlutterApplovinMax.isInterstitialLoaded(
                                    listener);
                            if (isInterstitialVideoAvailable) {
                              FlutterApplovinMax.showInterstitialVideo(
                                  (AppLovinAdListener event) =>
                                      listener(event));
                            }
                            Fluttertoast.showToast(
                                msg: "Coming Soon...",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          },
                          child: Container(
                            height: 90,
                            width: 75,
                            child: Column(
                              children: [
                                Center(
                                  child: Image(
                                    height: 40,
                                    image: AssetImage('assets/images/RD.png'),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'RD',
                                  style: TextStyle(
                                    color: Color(0xff324367),
                                  ),
                                ),
                                Text(
                                  'Calculator',
                                  style: TextStyle(
                                    color: Color(0xff324367),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(),
                        GestureDetector(
                          onTap: () async {
                            isInterstitialVideoAvailable =
                                await FlutterApplovinMax.isInterstitialLoaded(
                                    listener);
                            if (isInterstitialVideoAvailable) {
                              FlutterApplovinMax.showInterstitialVideo(
                                  (AppLovinAdListener event) =>
                                      listener(event));
                            }
                            Fluttertoast.showToast(
                                msg: "Coming Soon...",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          },
                          child: Container(
                            height: 90,
                            width: 75,
                            child: Column(
                              children: [
                                Center(
                                  child: Image(
                                    height: 40,
                                    image: AssetImage('assets/images/PPF.png'),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'PPF',
                                  style: TextStyle(
                                    color: Color(0xff324367),
                                  ),
                                ),
                                Text(
                                  'Calculator',
                                  style: TextStyle(
                                    color: Color(0xff324367),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Mutual Fund & SIP',
                  style: TextStyle(
                      color: Color(0xff324367),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 3,
                  color: Colors.white,
                  shadowColor: Color(0xff324367),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                      width: screenSize.width,
                      height: 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          GestureDetector(
                            onTap: () async {
                              isInterstitialVideoAvailable =
                                  await FlutterApplovinMax.isInterstitialLoaded(
                                      listener);
                              if (isInterstitialVideoAvailable) {
                                FlutterApplovinMax.showInterstitialVideo(
                                    (AppLovinAdListener event) =>
                                        listener(event));
                              }
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EMI(),
                                ),
                              );
                            },
                            child: Container(
                              height: 90,
                              width: 75,
                              child: Column(
                                children: [
                                  Center(
                                    child: Image(
                                      height: 40,
                                      image: AssetImage(
                                          'assets/images/calculator.png'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'EMI',
                                    style: TextStyle(
                                        color: Color(0xff324367),
                                        letterSpacing: 1),
                                  ),
                                  Text(
                                    'Calculator',
                                    style: TextStyle(
                                      color: Color(0xff324367),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(),
                          GestureDetector(
                            onTap: () async {
                              isInterstitialVideoAvailable =
                                  await FlutterApplovinMax.isInterstitialLoaded(
                                      listener);
                              if (isInterstitialVideoAvailable) {
                                FlutterApplovinMax.showInterstitialVideo(
                                    (AppLovinAdListener event) =>
                                        listener(event));
                              }
                              Fluttertoast.showToast(
                                  msg: "Coming Soon...",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            },
                            child: Container(
                              height: 90,
                              width: 75,
                              child: Column(
                                children: [
                                  Center(
                                    child: Image(
                                      height: 40,
                                      image: AssetImage(
                                          'assets/images/accounting.png'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Pro EMI',
                                    style: TextStyle(
                                      color: Color(0xff324367),
                                    ),
                                  ),
                                  Text(
                                    'Calculator',
                                    style: TextStyle(
                                      color: Color(0xff324367),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(),
                          GestureDetector(
                            onTap: () async {
                              isInterstitialVideoAvailable =
                                  await FlutterApplovinMax.isInterstitialLoaded(
                                      listener);
                              if (isInterstitialVideoAvailable) {
                                FlutterApplovinMax.showInterstitialVideo(
                                    (AppLovinAdListener event) =>
                                        listener(event));
                              }
                              Fluttertoast.showToast(
                                  msg: "Coming Soon...",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            },
                            child: Container(
                              height: 90,
                              width: 75,
                              child: Column(
                                children: [
                                  Center(
                                    child: Image(
                                      height: 40,
                                      image: AssetImage(
                                          'assets/images/signing.png'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Compare',
                                    style: TextStyle(
                                      color: Color(0xff324367),
                                    ),
                                  ),
                                  Text(
                                    'Loan',
                                    style: TextStyle(
                                      color: Color(0xff324367),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(),
                          GestureDetector(
                            onTap: () async {
                              isInterstitialVideoAvailable =
                                  await FlutterApplovinMax.isInterstitialLoaded(
                                      listener);
                              if (isInterstitialVideoAvailable) {
                                FlutterApplovinMax.showInterstitialVideo(
                                    (AppLovinAdListener event) =>
                                        listener(event));
                              }
                              Fluttertoast.showToast(
                                  msg: "Coming Soon...",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            },
                            child: Container(
                              height: 90,
                              width: 75,
                              child: Column(
                                children: [
                                  Center(
                                    child: Image(
                                      height: 40,
                                      image: AssetImage(
                                          'assets/images/scientific-calculator.png'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'EMI in',
                                    style: TextStyle(
                                      color: Color(0xff324367),
                                    ),
                                  ),
                                  Text(
                                    'Advance',
                                    style: TextStyle(
                                      color: Color(0xff324367),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
