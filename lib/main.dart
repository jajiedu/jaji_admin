import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaji_admin/screens/main/main_screen.dart';
import 'package:split_view/split_view.dart';
import 'constant/constants.dart';

Future<void> main() async {
  await Firebase.initializeApp();
  Future<FirebaseApp> initialization = Firebase.initializeApp();
  FirebaseFirestore firebaseFiretore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jaji Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: MainScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: SplitView(
        children: [
          SplitView(
            viewMode: SplitViewMode.Horizontal,
            indicator: SplitIndicator(viewMode: SplitViewMode.Horizontal),
            activeIndicator: SplitIndicator(
              viewMode: SplitViewMode.Horizontal,
              isActive: true,
            ),
            children: [
              Container(
                child: Center(child: Text("View1")),
                color: Colors.red,
              ),
              Container(
                child: Center(child: Text("View2")),
                color: Colors.blue,
              ),
              Container(
                child: Center(child: Text("View3")),
                color: Colors.green,
              ),
            ],
            onWeightChanged: (w) => print("Horizon: $w"),
          ),
          Container(
            child: Center(child: Text("View4")),
            color: Colors.purple,
          ),
          Container(
            child: Center(child: Text("View5")),
            color: Colors.yellow,
          ),
        ],
        viewMode: SplitViewMode.Vertical,
        indicator: SplitIndicator(viewMode: SplitViewMode.Vertical),
        activeIndicator: SplitIndicator(
          viewMode: SplitViewMode.Vertical,
          isActive: true,
        ),
        controller: SplitViewController(limits: [null, WeightLimit(max: 0.5)]),
        onWeightChanged: (w) => print("Vertical $w"),
      ),
    );
  }
}
