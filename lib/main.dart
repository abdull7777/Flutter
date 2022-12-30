import 'package:flutter/material.dart';
import 'package:untitled4/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blueGrey,
      ),
      // home: const MyHomePage(title: 'Welcome to first app'),
      onGenerateRoute: Routes.generateR,
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  List<Widget> widgetOptions (BuildContext context) {
    return [
      Container(
        child: Center(
          child: TextButton(child: Text("click here"),
              onPressed: () {
                Navigator.of(context).pushNamed("secound");
              }),
        ),
      ),
      Container(
        child: Center(
          child: Text("Welcome",
              style: (TextStyle(color: Colors.blueGrey, fontSize: 50))),
        ),
      ),
      Container(
        child: Center(
          child: Text("Hello",
              style: (TextStyle(color: Colors.blueGrey, fontSize: 50))),
        ),
      ),

    ];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.blueGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Sign in"),
            Text("Create acount"),
          ],
        ),
      ),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Welcome to first app"),
      ),
      body:Container(
        child: widgetOptions(context)[index],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add),backgroundColor: Colors.white,label: "خدمات",tooltip: "خدمات",),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_sharp),backgroundColor: Colors.white,label: "المحفظة",tooltip: "المحفظة",),
          BottomNavigationBarItem(icon: Icon(Icons.add_call),backgroundColor: Colors.white,label: "اتصل بنا",tooltip: "اتصل بنا",),

        ],
        onTap: (i){
          setState(() {
            index=i;
          });
        },
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
