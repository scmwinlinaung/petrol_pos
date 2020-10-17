import 'package:OilPos/src/authentication_bloc/authentication_bloc.dart';
import 'package:OilPos/src/authentication_bloc/authentication_event.dart';
import 'package:OilPos/src/screens/home/sales_vouncher.dart';
import 'package:OilPos/src/screens/in_stock/in_stock_page.dart';
import 'package:OilPos/src/screens/purchase/purchase_page.dart';
import 'package:OilPos/src/screens/sale/sale_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql/client.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Home',
          style: Theme.of(context).textTheme.headline1,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
            },
          )
        ],
        iconTheme: new IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'လှမြဆီရောင်းဝယ်ရေး',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            Card(
              child: ListTile(
                leading: Image(
                    image: AssetImage('assets/images/purchases_record.png'),
                    height: 30,
                    width: 30),
                title: Text(
                  'အရောင်းစာရင်း',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return SalePage();
                  }));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Image(
                    image: AssetImage('assets/images/sales_record.png'),
                    height: 30,
                    width: 30),
                title: Text(
                  'အဝယ်စာရင်း',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return PurchasePage();
                  }));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Image(
                    image: AssetImage('assets/images/sales_record.png'),
                    height: 30,
                    width: 30),
                title: Text(
                  'အရောင်းကြွေးကျန်',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Image(
                    image: AssetImage('assets/images/purchases_record.png'),
                    height: 30,
                    width: 30),
                title: Text(
                  'အဝယ်ကြွေးကျန်',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Image(
                  image: AssetImage('assets/images/data.png'),
                  height: 30,
                  width: 30,
                ),
                title: Text(
                  'ပစ္စည်းလက်ကျန်',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return InStockPage();
                  }));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Image(
                  image: AssetImage('assets/images/data.png'),
                  height: 30,
                  width: 30,
                ),
                title: Text(
                  'အရှုး/အမြတ်',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Image(
                    image: AssetImage('assets/images/sales_vouncher.png'),
                    height: 30,
                    width: 30),
                title: Text(
                  'အရောင်းဘောင်ချာထုတ်ရန်',
                  style: Theme.of(context).textTheme.bodyText1,
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
      body: _buildMainDesign(),
    );
  }

  Widget _buildMainDesign() {
    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: <Widget>[
    //     Container(
    //       height: 200,
    //       padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    //       child: Card(
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(10.0),
    //         ),
    //         color: Colors.lightBlue[700],
    //         child: ListTile(
    //           leading: Image(
    //             image: AssetImage('assets/images/oil_pump.png'),
    //             height: 50,
    //             width: 50,
    //             color: Colors.white,
    //           ),
    //           title: Text(
    //             'Brent Oil',
    //             textAlign: TextAlign.center,
    //             style: TextStyle(
    //                 color: Colors.white,
    //                 fontSize: 30,
    //                 fontWeight: FontWeight.bold),
    //           ),
    //           subtitle: Text(
    //             'ယ‌နေ့ပေါက်ဈေး',
    //             textAlign: TextAlign.center,
    //             style: TextStyle(
    //                 color: Colors.white,
    //                 fontSize: 25,
    //                 fontWeight: FontWeight.bold),
    //           ),
    //           trailing: Text(
    //             '\$ 30',
    //             textAlign: TextAlign.center,
    //             style: TextStyle(
    //                 color: Colors.white,
    //                 fontSize: 30,
    //                 fontWeight: FontWeight.bold),
    //           ),
    //         ),
    //       ),
    //     ),
    //     SizedBox(
    //       height: 40,
    //     ),
    //     Container(
    //       height: 200,
    //       padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    //       child: Card(
    //         shadowColor: Colors.grey,
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(10.0),
    //         ),
    //         color: Colors.lightBlue[700],
    //         child: ListTile(
    //           leading: Image(
    //             image: AssetImage('assets/images/oil_pump.png'),
    //             height: 50,
    //             width: 50,
    //             color: Colors.white,
    //           ),
    //           title: Text(
    //             'WTI Oil',
    //             textAlign: TextAlign.center,
    //             style: TextStyle(
    //                 color: Colors.white,
    //                 fontSize: 30,
    //                 fontWeight: FontWeight.bold),
    //           ),
    //           subtitle: Text(
    //             'ယ‌နေ့ပေါက်ဈေး',
    //             textAlign: TextAlign.center,
    //             style: TextStyle(
    //                 color: Colors.white,
    //                 fontSize: 25,
    //                 fontWeight: FontWeight.bold),
    //           ),
    //           trailing: Text(
    //             '\$ 30',
    //             textAlign: TextAlign.center,
    //             style: TextStyle(
    //                 color: Colors.white,
    //                 fontSize: 30,
    //                 fontWeight: FontWeight.bold),
    //           ),
    //         ),
    //       ),
    //     )
    //   ],
    // );
  }
}
