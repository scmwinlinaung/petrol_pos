import 'package:OilPos/src/viewModels/home/homeViewModel.dart';
import 'package:OilPos/src/widgets/line_chart.dart';
import 'package:OilPos/src/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LineChartPage extends StatelessWidget {
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
                padding: const EdgeInsets.all(5.0),
                child: Consumer<HomeViewModel>(
                    builder: (context, homeViewModel, child) {
                  if (homeViewModel.dailySaleReports.length > 0)
                    return LineChart(
                      saleReports: homeViewModel.dailySaleReports,
                    );
                  else
                    return LoadingIndicator();
                }))),
      ),
    );
  }
}
