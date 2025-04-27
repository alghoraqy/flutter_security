import 'package:flutter/material.dart';
import 'package:flutter_security/dp.dart';
import 'package:flutter_security/secure_storage.dart';

void main() async {
  await DependencyInjectionServices.diInit();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    getData();
    super.initState();
  }

 Future getData() async {
    final data = await sl<ISecureStorageManager>().getData(key: 'token');
    print('Data: $data');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('Hello World!')),
            SizedBox(height: 20),
            MaterialButton(
              onPressed: () {
                sl<ISecureStorageManager>().setData(key: 'token', value: '12345678');
              },
              child: Text('Set Data'),
            ),
          ],
        ),
      ),
    );
  }
}
