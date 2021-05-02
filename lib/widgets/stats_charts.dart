import 'package:simple_hour/index.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class StatsCharts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      _createSampleData(),
      barRendererDecorator: charts.BarLabelDecorator<String>(
        outsideLabelStyleSpec: charts.TextStyleSpec(color: charts.Color.white),
      ),
      domainAxis: charts.OrdinalAxisSpec(),
    );
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      OrdinalSales('2014', 5),
      OrdinalSales('2015', 25),
      OrdinalSales('2016', 100),
      OrdinalSales('2017', 75),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Sales',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
        labelAccessorFn: (OrdinalSales sales, _) => '${sales.sales.toString()}',
      )
    ];
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
