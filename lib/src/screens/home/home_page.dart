import 'package:OilPos/src/screens/home/sales_vouncher.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        iconTheme: new IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'လှမြဆီရောင်းဝယ်ရေး',
                style: Theme.of(context).textTheme.title,
                textAlign: TextAlign.center,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            Card(
            child: ListTile(
              leading: Image(image: AssetImage('assets/images/data.png'), height: 30, width: 30,),
              title: Text(
                'အချက်အလက်',
                style: Theme.of(context).textTheme.body1,
                
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ),
            Card(
            child: ListTile(
              leading: Image(image: AssetImage('assets/images/purchases_record.png'), height: 30, width: 30),
              title: Text(
                'အရောင်းစာရင်း',
                style: Theme.of(context).textTheme.body1,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return null;
                }));
              },
            ),
            ),
            Card(
            child: ListTile(
              leading: Image(image: AssetImage('assets/images/sales_record.png'), height: 30, width: 30),
              title: Text(
                'အဝယ်စာရင်း',
                style: Theme.of(context).textTheme.body1,
              ),
              enabled: false,
            ),
            ),
            Card(
            child:ListTile(
              leading: Image(image: AssetImage('assets/images/sales_vouncher.png'), height: 30, width: 30),
              title: Text(
                'အရောင်းဘောင်ချာထုတ်ရန်',
                style: Theme.of(context).textTheme.body1,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return SalesVouncher();
                }));
              },
            ),
            ),
          ],
        ),
      ),
    );
  }
}