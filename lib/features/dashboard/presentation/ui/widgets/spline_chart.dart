/// Package import
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';






class SpineChartWidget extends StatefulWidget {
  const SpineChartWidget({super.key});

  @override
  State<SpineChartWidget> createState() => _SpineChartWidgetState();
}

class _SpineChartWidgetState extends State<SpineChartWidget> {
  @override
  void initState() {
    chartData = <ChartSampleData>[
      ChartSampleData(
          x: 'Jan', y: 43, secondSeriesYValue: 37, thirdSeriesYValue: 41),
      ChartSampleData(
          x: 'Feb', y: 45, secondSeriesYValue: 37, thirdSeriesYValue: 45),
      ChartSampleData(
          x: 'Mar', y: 50, secondSeriesYValue: 39, thirdSeriesYValue: 48),
      ChartSampleData(
          x: 'Apr', y: 55, secondSeriesYValue: 43, thirdSeriesYValue: 52),
      ChartSampleData(
          x: 'May', y: 63, secondSeriesYValue: 48, thirdSeriesYValue: 57),
      ChartSampleData(
          x: 'Jun', y: 68, secondSeriesYValue: 54, thirdSeriesYValue: 61),
      ChartSampleData(
          x: 'Jul', y: 72, secondSeriesYValue: 57, thirdSeriesYValue: 66),
      ChartSampleData(
          x: 'Aug', y: 70, secondSeriesYValue: 57, thirdSeriesYValue: 66),
      ChartSampleData(
          x: 'Sep', y: 66, secondSeriesYValue: 54, thirdSeriesYValue: 63),
      ChartSampleData(
          x: 'Oct', y: 57, secondSeriesYValue: 48, thirdSeriesYValue: 55),
      ChartSampleData(
          x: 'Nov', y: 50, secondSeriesYValue: 43, thirdSeriesYValue: 50),
      ChartSampleData(
          x: 'Dec', y: 45, secondSeriesYValue: 37, thirdSeriesYValue: 45)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildDefaultSplineChart();
  }

  List<ChartSampleData>? chartData;

  /// Returns the defaul spline chart.
  SfCartesianChart _buildDefaultSplineChart() {
    bool isCardView = true;
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: isCardView ? '' : 'Average high/low temperature of London'),
      legend: Legend(isVisible: !isCardView),
      primaryXAxis: const CategoryAxis(
          majorGridLines: MajorGridLines(width: 0),
          labelPlacement: LabelPlacement.onTicks),
      primaryYAxis: const NumericAxis(
          minimum: 30,
          maximum: 80,
          axisLine: AxisLine(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          labelFormat: '{value}',
          majorTickLines: MajorTickLines(size: 0)),
      series: _getDefaultSplineSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// Returns the list of chart series which need to render on the spline chart.
  List<SplineSeries<ChartSampleData, String>> _getDefaultSplineSeries() {
    return <SplineSeries<ChartSampleData, String>>[
      SplineSeries<ChartSampleData, String>(
        dataSource: chartData,
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        markerSettings: const MarkerSettings(isVisible: true),
        name: '',
      ),
     /* SplineSeries<ChartSampleData, String>(
        dataSource: chartData,
        name: 'Low',
        markerSettings: const MarkerSettings(isVisible: true),
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        yValueMapper: (ChartSampleData sales, _) => sales.secondSeriesYValue,
      )*/
    ];
  }

  @override
  void dispose() {
    chartData!.clear();
    super.dispose();
  }
}

///Chart sample data
class ChartSampleData {
  /// Holds the datapoint values like x, y, etc.,
  ChartSampleData(
      {this.x,
        this.y,
        this.xValue,
        this.yValue,
        this.secondSeriesYValue,
        this.thirdSeriesYValue,
        this.pointColor,
        this.size,
        this.text,
        this.open,
        this.close,
        this.low,
        this.high,
        this.volume});

  /// Holds x value of the datapoint
  final dynamic x;

  /// Holds y value of the datapoint
  final num? y;

  /// Holds x value of the datapoint
  final dynamic xValue;

  /// Holds y value of the datapoint
  final num? yValue;

  /// Holds y value of the datapoint(for 2nd series)
  final num? secondSeriesYValue;

  /// Holds y value of the datapoint(for 3nd series)
  final num? thirdSeriesYValue;

  /// Holds point color of the datapoint
  final Color? pointColor;

  /// Holds size of the datapoint
  final num? size;

  /// Holds datalabel/text value mapper of the datapoint
  final String? text;

  /// Holds open value of the datapoint
  final num? open;

  /// Holds close value of the datapoint
  final num? close;

  /// Holds low value of the datapoint
  final num? low;

  /// Holds high value of the datapoint
  final num? high;

  /// Holds open value of the datapoint
  final num? volume;
}
