import 'package:OilPos/src/authentication_bloc/authentication_bloc.dart';
import 'package:OilPos/src/authentication_bloc/authentication_event.dart';
import 'package:OilPos/src/views/home/bloc/bloc.dart';
import 'package:OilPos/src/widgets/loading_indicator.dart';
import 'package:OilPos/src/widgets/line_chart.dart';
import 'package:OilPos/src/views/home/sales_vouncher.dart';
import 'package:OilPos/src/views/in_stock/in_stock_page.dart';
import 'package:OilPos/src/views/purchase/purchase_page.dart';
import 'package:OilPos/src/views/purchase_debt/purchase_debt_page.dart';
import 'package:OilPos/src/views/sale/sale_page.dart';
import 'package:OilPos/src/views/sale_debt/sale_debt_page.dart';
import 'package:OilPos/src/widgets/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/group_bar_chart.dart';

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
                      image: AssetImage('assets/images/sales_record.png'),
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
                      image: AssetImage('assets/images/purchases_record.png'),
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
                      image: AssetImage('assets/images/debt.png'),
                      height: 30,
                      width: 30),
                  title: Text(
                    'အရောင်းကြွေးကျန်',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return SaleDebtPage();
                    }));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image(
                      image: AssetImage('assets/images/debt.png'),
                      height: 30,
                      width: 30),
                  title: Text(
                    'အဝယ်ကြွေးကျန်',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return PurchaseDebtPage();
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
        body: BlocProvider<HomeBloc>(
          create: (context) => HomeBloc()..add(GetSaleReport()),
          child: _buildMainDesign(context),
        ));
  }

  Widget _buildMainDesign(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state.saleReports.length > 0) {
        return SingleChildScrollView(
            child: Container(
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          color: Colors.grey[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Sale Report",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: LineChart(
                        saleReports: state.saleReports,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: PieChart(
                    saleReports: state.saleReports,
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: GroupedBarChart(
                          saleReports: state.saleReports,
                        ),
                      ))),
            ],
          ),
        ));
      } else {
        return LoadingIndicator();
      }
    });
  }
}
