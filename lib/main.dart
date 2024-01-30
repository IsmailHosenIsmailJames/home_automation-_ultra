import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Automation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedL1 = 0;
  int selectedL2 = 0;
  int selectedF1 = 0;
  final refL = FirebaseDatabase.instance.ref("al1");
  final refF = FirebaseDatabase.instance.ref("af1");
  final refL2 = FirebaseDatabase.instance.ref("al2");

  void getSelected() async {
    final light1 = await refL.get();
    final fan1 = await refF.get();
    final light2 = await refL2.get();

    Object value1 = light1.value!;
    Object value2 = fan1.value!;
    Object value3 = light2.value!;
    setState(() {
      selectedL1 = value1 as int;
      selectedF1 = value2 as int;
      selectedL2 = value3 as int;
    });
  }

  @override
  void initState() {
    getSelected();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Smart Home Automation Ultra"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey, width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Select Your Choice For Light No. 1",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              selectedL1 == -1 ? Colors.green : Colors.grey,
                        ),
                        onPressed: () async {
                          await refL.set(-1);
                          setState(() {
                            selectedL1 = -1;
                          });
                        },
                        child: const Text(
                          "OFF",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              selectedL1 == 0 ? Colors.green : Colors.grey,
                        ),
                        onPressed: () async {
                          await refL.set(0);
                          setState(() {
                            selectedL1 = 0;
                          });
                        },
                        child: const Text(
                          "Auto",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              selectedL1 == 1 ? Colors.green : Colors.grey,
                        ),
                        onPressed: () async {
                          await refL.set(1);
                          setState(() {
                            selectedL1 = 1;
                          });
                        },
                        child: const Text(
                          "ON",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey, width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Select Your Choice For Light No. 2",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              selectedL2 == -1 ? Colors.green : Colors.grey,
                        ),
                        onPressed: () async {
                          await refL2.set(-1);
                          setState(() {
                            selectedL2 = -1;
                          });
                        },
                        child: const Text(
                          "OFF",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              selectedL2 == 0 ? Colors.green : Colors.grey,
                        ),
                        onPressed: () async {
                          await refL2.set(0);
                          setState(() {
                            selectedL2 = 0;
                          });
                        },
                        child: const Text(
                          "Auto",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              selectedL2 == 1 ? Colors.green : Colors.grey,
                        ),
                        onPressed: () async {
                          await refL2.set(1);
                          setState(() {
                            selectedL2 = 1;
                          });
                        },
                        child: const Text(
                          "ON",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey, width: 2),
              ),
              child: Column(
                children: [
                  const Text(
                    "Select Your Choice For Fan No. 1",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              selectedF1 == -1 ? Colors.green : Colors.grey,
                        ),
                        onPressed: () async {
                          await refF.set(-1);
                          setState(() {
                            selectedF1 = -1;
                          });
                        },
                        child: const Text(
                          "OFF",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              selectedF1 == 0 ? Colors.green : Colors.grey,
                        ),
                        onPressed: () async {
                          await refF.set(0);
                          setState(() {
                            selectedF1 = 0;
                          });
                        },
                        child: const Text(
                          "Auto",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              selectedF1 == 1 ? Colors.green : Colors.grey,
                        ),
                        onPressed: () async {
                          await refF.set(1);
                          setState(() {
                            selectedF1 = 1;
                          });
                        },
                        child: const Text(
                          "ON",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
