import 'package:auto_size_text/auto_size_text.dart';
import 'package:badminton/flip_model.dart';
import 'package:badminton/flip_num_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: CounterModel(),
      child: MaterialApp(
        title: 'Badminton',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Badminton'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return ChangeNotifierProvider.value(
      value: CounterModel(),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Flexible(
              //   flex: 2,
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(vertical: 30),
              //     child: Text(
              //       '紫云菜鸟杯计分板',
              //       style: TextStyle(
              //           color: Colors.black,
              //           fontSize: 40,
              //           fontWeight: FontWeight.bold),
              //     ),
              //   ),
              // ),
              Flexible(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Flexible(
                        flex: 4,
                        child: Center(
                          child: FlipNumText(),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: AutoSizeText(
                          ":",
                          minFontSize: 12,
                          maxFontSize: double.infinity,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 400,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        child: Center(
                          child: FlipNumText(),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
        floatingActionButton: Consumer<CounterModel>(
          builder: (context, counter, _) => FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              counter.cleanAll();
            },
            tooltip: 'clear',
            child: const Icon(
              Icons.cleaning_services,
            ),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
