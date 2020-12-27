import 'package:OilPos/src/viewModels/home/saleReportViewModal.dart';
import 'package:OilPos/src/views/home/model/saleReport.dart';

/// Example of a simple line chart.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class LineChart extends StatelessWidget {
  final List<SaleReportViewModal> saleReports;

  const LineChart({Key key, this.saleReports}) : super(key: key);
  // final List<charts.Series> seriesList;
  // final bool animate;

  // LineChart(this.seriesList, {this.animate});

  // /// Creates a [LineChart] with sample data and no transition.
  // factory LineChart.withSampleData() {
  //   return new LineChart(
  //     _createSampleData(),
  //     // Disable animations for image tests.
  //     animate: false,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(_createSampleData(), animate: true);
  }

  /// Create one series with sample hard coded data.
  List<charts.Series<LinearSales, int>> _createSampleData() {
    final salesReport = saleReports.map((saleReport) {
      return LinearSales(
          saleReport.month, int.parse(saleReport.totalOfQty.toString()));
    }).toList();

    // final data = [
    //   new LinearSales(0, 5),
    //   new LinearSales(1, 25),
    //   new LinearSales(2, 100),
    //   new LinearSales(3, 75),
    // ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.month,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: salesReport,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int month;
  final int sales;

  LinearSales(this.month, this.sales);
}
