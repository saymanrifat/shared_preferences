import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();

  void saveMyData(String text) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("text", text);
  }

  void readMyData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? savedData = pref.getString("text");

    if (savedData != null) {
      controller.text = savedData;
    }
  }

  @override
  void initState() {
    super.initState();
    readMyData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TextField(
          controller: controller,
          onChanged: (val) {
            saveMyData(val);
            print(val);
          },
        ),
      ),
    );
  }
}
