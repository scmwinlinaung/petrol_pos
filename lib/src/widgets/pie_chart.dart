import 'package:OilPos/src/viewModels/home/saleReportViewModal.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class PieChart extends StatelessWidget {
  final List<SaleReportViewModal> saleReports;

  const PieChart({Key key, this.saleReports}) : super(key: key);
  // final bool animate;

  // PieChart(this.seriesList, {this.animate});

  /// Creates a [PieChart] with sample data and no transition.
  // factory PieChart.withSampleData() {
  //   return new PieChart(
  //     _createSampleData(),
  //     // Disable animations for image tests.
  //     animate: false,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(_createSampleData(),
        animate: true,

        // Add an [ArcLabelDecorator] configured to render labels outside of the
        // arc with a leader line.
        //
        // Text style for inside / outside can be controlled independently by
        // setting [insideLabelStyleSpec] and [outsideLabelStyleSpec].
        //
        // Example configuring different styles for inside/outside:
        //       new charts.ArcLabelDecorator(
        //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
        //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
        defaultRenderer: new charts.ArcRendererConfig(arcRendererDecorators: [
          new charts.ArcLabelDecorator(
              labelPosition: charts.ArcLabelPosition.inside)
        ]));
  }

  /// Create one series with sample hard coded data.
  List<charts.Series<LinearSales, String>> _createSampleData() {
    var foreignOilSales = saleReports
        .where((element) => element.goodType == "နိုင်ငံခြားဆီ")
        .fold(
            0, (previousValue, element) => previousValue + element.totalOfQty);

    var traditionalOilSales = saleReports
        .where((element) => element.goodType == "ချက်ဆီ")
        .fold(
            0, (previousValue, element) => previousValue + element.totalOfQty);

    final data = [
      new LinearSales("နိုင်ငံခြားဆီ", foreignOilSales),
      new LinearSales("ချက်ဆီ", traditionalOilSales),
    ];

    return [
      new charts.Series<LinearSales, String>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.goodType,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
        // Set a label accessor to control the text of the arc label.
        colorFn: (LinearSales sales, _) {
          if (sales.goodType == "ချက်ဆီ")
            return charts.MaterialPalette.deepOrange.shadeDefault;
          else
            return charts.MaterialPalette.blue.shadeDefault;
        },
        insideLabelStyleAccessorFn: (LinearSales sales, _) {
          return new charts.TextStyleSpec(
              color: charts.MaterialPalette.white,
              fontSize: 14,
              fontFamily: 'Pyidaungsu');
        },
        labelAccessorFn: (LinearSales row, _) =>
            '${row.goodType}: ${row.sales}',
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final String goodType;
  final int sales;

  LinearSales(this.goodType, this.sales);
}
