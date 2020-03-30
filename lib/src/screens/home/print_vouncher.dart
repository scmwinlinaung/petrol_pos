
import 'dart:io';
import 'dart:typed_data';
import 'package:OilPos/src/screens/home/sales_vouncher.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';


class PrintVouncher extends StatefulWidget {
  String customerName;
  String date;
  String quantity;
  String price;
  String debt;
  PrintVouncher({
    Key key, 
    @required this.customerName, 
    @required this.date,
    @required this.quantity,
    @required this.price,
    @required this.debt
    }) : super(key: key);
 @override
 _PrintVouncherState createState() => new _PrintVouncherState();
}

class _PrintVouncherState extends State<PrintVouncher> {
  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

  List<BluetoothDevice> _devices = [];
  BluetoothDevice _device;
  bool _connected = false;
  bool _pressed = false;
  String pathImage;

  @override
  void initState() {
   super.initState();
   initPlatformState();
   initSavetoPath();
  }

 initSavetoPath()async{
    //read and write
    //image max 300px X 300px
    final filename = 'yourlogo.png';
    var bytes = await rootBundle.load("assets/images/yourlogo.png");
    String dir = (await getApplicationDocumentsDirectory()).path;
    writeToFile(bytes,'$dir/$filename');
    setState(() {
     pathImage='$dir/$filename';
   });
 }

  Future<void> initPlatformState() async {
    List<BluetoothDevice> devices = [];

   try {
     devices = await bluetooth.getBondedDevices();
   } on PlatformException {
     // TODO - Error
   }

   bluetooth.onStateChanged().listen((state) {
     switch (state) {
        case BlueThermalPrinter.CONNECTED:
        print('connect');
          setState(() {
            _connected = true;
            _pressed = false;
         });
          Fluttertoast.showToast(
              msg: "Connect With Bluetooth Printer",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0
          );
         break;
        case BlueThermalPrinter.DISCONNECTED:
        print('disconnect');
         setState(() {
           _connected = false;
           _pressed = false;
          });
          Fluttertoast.showToast(
              msg: "Disconnect With Bluetooth Printer",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
              backgroundColor: Colors.grey[200],
              textColor: Colors.red,
              fontSize: 16.0
          );
         break;
        default:
          print(state);
          break;
     }
   });

    if (!mounted) return;
   setState(() {
      _devices = devices;
   });
  }

 @override
 Widget build(BuildContext context) {
   print(widget.price);
   print(widget.debt);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(icon:Icon(Icons.arrow_back),
          onPressed:() => Navigator.pop(context, false),
        ),
          title: Text(
            'အရောင်းဘောင်ချာထုတ်ရန်',
            style: Theme.of(context).textTheme.title
            ),
       ),
        body: Container(
         child: ListView(
           children: <Widget>[
             Padding(
               padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
               child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   Text(
                      'Device:',
                     style: Theme.of(context).textTheme.body1
                    ),
                   DropdownButton(
                      items: _getDeviceItems(),
                      onChanged: (value) => setState(() => _device = value),
                      value: _device,
                   ),
                   RaisedButton(
                      onPressed:
                     _pressed ? null : _connected ? _disconnect : _connect,
                      child: Text(
                        _connected ? 'မချိတ်ဆက်ပါ' : 'ချိတ်ဆက်သည်',
                        style: Theme.of(context).textTheme.title
                        ),
                      
                    ),
                 ],
               ),
             ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 50),
                child:  RaisedButton(
                  color: Colors.lightBlueAccent,
                  textColor: Colors.white,
                  onPressed: _connected ? _tesPrint : null,
                 child: Text(
                   'ဘောင်ချာထုတ်ရန်',
                    style: Theme.of(context).textTheme.title
                   ),
               ),
             ),
            ],
         ),
        ),
     ),
   );
 }
 List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems() {
    List<DropdownMenuItem<BluetoothDevice>> items = [];
   if (_devices.isEmpty) {
     items.add(DropdownMenuItem(
       child: Text('NONE'),
     ));
    } else {
     _devices.forEach((device) {
       items.add(DropdownMenuItem(
        child: Text(device.name),
          value: device,
       ));
     });
   }
   return items;
  }
  void _connect() {
    if (_device == null) {
     show('No device selected.');
   } else {
      bluetooth.isConnected.then((isConnected) {
       if (!isConnected) {
          bluetooth.connect(_device).catchError((error) {
           setState(() => _pressed = false);
         });
         setState(() => _pressed = true);
       }
      });
    }
 }
  void _disconnect() {
    bluetooth.disconnect();
    setState(() => _pressed = true);
 }

//write to app path
 Future<void> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return new File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
 }

  void _tesPrint() async {
    //SIZE
    // 0- normal size text
    // 1- only bold text
   // 2- bold with medium text
   // 3- bold with large text
   //ALIGN
   // 0- ESC_ALIGN_LEFT
   // 1- ESC_ALIGN_CENTER
    // 2- ESC_ALIGN_RIGHT
    bluetooth.isConnected.then((isConnected) {
      if (isConnected) {
        bluetooth.printCustom("HEADER",3,1);
        bluetooth.printNewLine();
        bluetooth.printImage(pathImage);
        bluetooth.printNewLine();
        bluetooth.printLeftRight("LEFT", "RIGHT",0);
        bluetooth.printLeftRight("LEFT", "RIGHT",1);
        bluetooth.printNewLine();
        bluetooth.printLeftRight("LEFT", "RIGHT",2);
        bluetooth.printCustom("Body left",1,0);
        bluetooth.printCustom("Body right",0,2);
        bluetooth.printNewLine();
        bluetooth.printCustom("Terimakasih",2,1);
        bluetooth.printNewLine();
        // bluetooth.printQRcode("Insert Your Own Text to Generate");
        bluetooth.printNewLine();
        bluetooth.printNewLine();
        bluetooth.paperCut();
        }
   });
  }
   Future show(
      String message, {
       Duration duration: const Duration(seconds: 3),
      }) async {
    await new Future.delayed(new Duration(milliseconds: 100));
   Scaffold.of(context).showSnackBar(
      new SnackBar(
        content: new Text(
          message,
         style: new TextStyle(
            color: Colors.white,
          ),
       ),
        duration: duration,
      ),
    );
 }
}