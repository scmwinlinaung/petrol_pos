import 'package:OilPos/src/viewModels/home/homeViewModel.dart';
import 'package:OilPos/src/widgets/group_bar_chart.dart';
import 'package:OilPos/src/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BarChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
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
                if (homeViewModel.monthlySaleReports.length > 0)
                  return GroupedBarChart(
                    saleReports: homeViewModel.yearlySaleReports,
                  );
                else
                  return LoadingIndicator();
              }))),
    ));
  }
}
