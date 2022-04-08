import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io' show Platform;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Device Info',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin(); // instantiate device info plugin
  late AndroidDeviceInfo androidDeviceInfo;
  String board = '';
  String brand = '';
  String hardware = '';
  String host = '';
  String id = '';
  String manufacture = '';
  String device = '';
  String model = '';
  String product = '';
  String type = '';
  String androidId = '';
  String osVersion = '';
  bool ? isphysicaldevice;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDeviceinfo();
  }

  void getDeviceinfo() async {
    androidDeviceInfo = await deviceInfo.androidInfo; // instantiate Android Device Infoformation

    setState(() {
      board = androidDeviceInfo.board!;
      brand = androidDeviceInfo.brand!;
      device = androidDeviceInfo.device!;

      hardware = androidDeviceInfo.hardware!;
      host = androidDeviceInfo.host!;
      id = androidDeviceInfo.id!;
      manufacture = androidDeviceInfo.manufacturer!;
      model = androidDeviceInfo.model!;
      product = androidDeviceInfo.product!;

      type = androidDeviceInfo.type!;
      isphysicaldevice = androidDeviceInfo.isPhysicalDevice!;
      androidId = androidDeviceInfo.androidId!;

      osVersion =Platform.operatingSystem +" "+ androidDeviceInfo.version.release!;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Device Info in Flutter"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                "Welcome to Soha Code",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    color: Colors.red),
              ),
            ),
            Text(
              "YOUR DEVICE INFORMATION",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Manufacture  : $manufacture",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Model  : $model",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),

            Text(
              "Brand   : $brand",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "OS: $osVersion ",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Board   : $board",
              style: TextStyle(fontSize: 20),
            ),

            SizedBox(
              height: 10,
            ),
            Text(
              "Device   : $device",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Hardware  :  $hardware ",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "ID   : $id",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),

            Text(
              "Product  :  $product",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Type   : $type",
              style: TextStyle(fontSize: 20),
            ),

            SizedBox(
              height: 10,
            ),
            Text(
              " Android ID: $androidId ",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Is Physical Device : $isphysicaldevice",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}