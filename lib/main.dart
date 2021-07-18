import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jaji_admin/screens/main/main_screen.dart';
import 'package:split_view/split_view.dart';

import 'constants.dart';
import 'excel/excel_ctrl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
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

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   ExcelCtrl excelCtrl = Get.put(ExcelCtrl());
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   String text =
//       '商品購入(しょうひんこうにゅう)（注(ちゅう)１）をuご希望(きぼう)uのお客様(きゃくさま)は、受付(うけつけ)でお渡(わた)ししたご来場者(らいじょうしゃ)カ(か)ード(ど)に商品番号(しょうひんばんごう)をご記入(きにゅう)いただき販売(はんばい)スタッフ(すたっふ)にお渡(わた)しください。販売(はんばい)スタッフ(すたっふ)がお届(とど)け先(さき)やご希望日(きぼうび)をお伺(うかが)いし、その後(ご)、お会計(かいけい)となります。なお、その際(さい)に会員証(かいいんしょう)を提示(ていじ)（注(ちゅう)２）されますと５％割引(わりびき)とさせていただきます。/n割引(わりびき)';

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextButton(
//                 onPressed: () {
//                   excelCtrl.pickerFileExcel();
//                 },
//                 child: Text('Chọn file')),
//             Obx(
//               () => Text(
//                 excelCtrl.nameFile!.value,
//               ),
//             ),
//             Obx(
//               () => Text(
//                 'Số lượng record: ${excelCtrl.total}',
//                 style: Theme.of(context).textTheme.headline4,
//               ),
//             ),
//             TextButton(
//                 onPressed: () {
//                   excelCtrl.exportExcelToFirebase();
//                 },
//                 child: Text('Bắt đầu Export')),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           excelCtrl.convertTextToRuby(text);
//         },
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
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
