import 'package:OilPos/src/pages/home/barChartPage.dart';
import 'package:OilPos/src/pages/home/lineChartPage.dart';
import 'package:OilPos/src/pages/home/pieChartPage.dart';
import 'package:OilPos/src/pages/inStock/inStockPage.dart';
import 'package:OilPos/src/pages/purchase/purchasePage.dart';
import 'package:OilPos/src/pages/purchaseDebt/purchaseDebtPage.dart';
import 'package:OilPos/src/pages/sale/salePage.dart';
import 'package:OilPos/src/pages/saleDebt/saleDebtPage.dart';
import 'package:OilPos/src/viewModels/home/homeViewModel.dart';
import 'package:OilPos/src/widgets/line_chart.dart';
import 'package:OilPos/src/widgets/loading_indicator.dart';
import 'package:OilPos/src/widgets/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/group_bar_chart.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  List<Widget> _children = new List(3);
  @override
  void initState() {
    _children = [LineChartPage(), PieChartPage(), BarChartPage()];
    super.initState();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            'Sale Report',
            style: Theme.of(context).textTheme.headline1,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {},
            )
          ],
          // iconTheme: new IconThemeData(color: Colors.white),
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
                  // onTap: () {
                  //   Navigator.pop(context);
                  //   Navigator.push(context, MaterialPageRoute(builder: (_) {
                  //     return SalesVouncher();
                  //   }));
                  // },
                ),
              ),
            ],
          ),
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: onTabTapped, // new
          selectedItemColor: Theme.of(context).primaryColor,

          currentIndex: _currentIndex, //
          // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.show_chart,
                ),
                label: "Daily"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.pie_chart,
                ),
                label: "Monthly"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.bar_chart,
                ),
                label: "Yearly"),
          ],
        ));
  }

  // Widget _buildMainDesign(BuildContext context) {
  //   //
  //   return SingleChildScrollView(
  //       child: Container(
  //     // height: MediaQuery.of(context).size.height,
  //     // width: MediaQuery.of(context).size.width,
  //     color: Colors.grey[200],
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         _buildLineChart(),
  //         _buildPieChart(),
  //         _buildGroupedBarChart(),
  //       ],
  //     ),
  //   ));
  // }

  Widget _buildLineChart(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Consumer<HomeViewModel>(
                  builder: (context, homeViewModel, child) {
                if (homeViewModel.saleReports.length > 0)
                  return LineChart(
                    saleReports: homeViewModel.saleReports,
                  );
                else
                  return LoadingIndicator();
              }))),
    ));
  }

  Widget _buildPieChart(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          height: 300,
          width: MediaQuery.of(context).size.width,
          child:
              Consumer<HomeViewModel>(builder: (context, homeViewModel, child) {
            if (homeViewModel.saleReports.length > 0)
              return PieChart(
                saleReports: homeViewModel.saleReports,
              );
            else
              return LoadingIndicator();
          })),
    ));
  }

  Widget _buildGroupedBarChart(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Consumer<HomeViewModel>(
                        builder: (context, homeViewModel, child) {
                      if (homeViewModel.saleReports.length > 0)
                        return GroupedBarChart(
                          saleReports: homeViewModel.saleReports,
                        );
                      else
                        return LoadingIndicator();
                    })))));
  }
}
