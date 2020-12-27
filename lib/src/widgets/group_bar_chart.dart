import 'package:OilPos/src/viewModels/home/saleReportViewModal.dart';
import 'package:OilPos/src/views/home/model/saleReport.dart';

/// Bar chart with example of a legend with customized position, justification,
/// desired max rows, and padding. These options are shown as an example of how
/// to use the customizations, they do not necessary have to be used together in
/// this way. Choosing [end] as the position does not require the justification
/// to also be [endDrawArea].
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

List months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];

class GroupedBarChart extends StatelessWidget {
  final List<SaleReportViewModal> saleReports;

  const GroupedBarChart({Key key, this.saleReports}) : super(key: key);
  // final bool animate;

  // GroupedBarChart(this.seriesList, {this.animate});

  // factory GroupedBarChart.withSampleData() {
  //   return new GroupedBarChart(
  //     _createSampleData(),
  //     // Disable animations for image tests.
  //     animate: false,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      _createSampleData(),
      animate: true,
      barGroupingType: charts.BarGroupingType.grouped,
      // Add the legend behavior to the chart to turn on legends.
      // This example shows how to optionally show measure and provide a custom
      // formatter.
      behaviors: [
        new charts.SeriesLegend(
          // Positions for "start" and "end" will be left and right respectively
          // for widgets with a build context that has directionality ltr.
          // For rtl, "start" and "end" will be right and left respectively.
          // Since this example has directionality of ltr, the legend is
          // positioned on the right side of the chart.
          position: charts.BehaviorPosition.end,
          // By default, if the position of the chart is on the left or right of
          // the chart, [horizontalFirst] is set to false. This means that the
          // legend entries will grow as new rows first instead of a new column.
          horizontalFirst: false,
          // This defines the padding around each legend entry.
          cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
          // Set show measures to true to display measures in series legend,
          // when the datum is selected.
          showMeasures: true,
          // Optionally provide a measure formatter to format the measure value.
          // If none is specified the value is formatted as a decimal.
          measureFormatter: (num value) {
            return value == null ? '-' : '${value}k';
          },
        ),
      ],
    );
  }

  /// Create series list with multiple series
  List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final foreignOil = saleReports
        .where((element) => element.goodType == "နိုင်ငံခြားဆီ")
        .map((saleReport) {
      return OrdinalSales(months[saleReport.month],
          int.parse(saleReport.totalOfQty.toString()));
    }).toList();

    final traditionalOil = saleReports
        .where((element) => element.goodType == "ချက်ဆီ")
        .map((saleReport) {
      return OrdinalSales(months[saleReport.month],
          int.parse(saleReport.totalOfQty.toString()));
    }).toList();

    // final mobileSalesData = [
    //   new OrdinalSales('1', 10),
    //   new OrdinalSales('2', 15),
    //   new OrdinalSales('3', 50),
    //   new OrdinalSales('4', 45),
    // ];

    // final otherSalesData = [
    //   new OrdinalSales('1', 20),
    //   new OrdinalSales('2', 35),
    //   new OrdinalSales('3', 15),
    //   new OrdinalSales('4', 10),
    // ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'နိုင်ငံခြားဆီ',
        domainFn: (OrdinalSales sales, _) => sales.month,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: foreignOil,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'ချက်ဆီ ',
        domainFn: (OrdinalSales sales, _) => sales.month,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: traditionalOil,
      ),
      // new charts.Series<OrdinalSales, String>(
      //   id: 'Mobile',
      //   domainFn: (OrdinalSales sales, _) => sales.month,
      //   measureFn: (OrdinalSales sales, _) => sales.sales,
      //   data: mobileSalesData,
      // ),
      // new charts.Series<OrdinalSales, String>(
      //   id: 'Other',
      //   domainFn: (OrdinalSales sales, _) => sales.month,
      //   measureFn: (OrdinalSales sales, _) => sales.sales,
      //   data: otherSalesData,
      // ),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String month;
  final int sales;

  OrdinalSales(this.month, this.sales);
}
