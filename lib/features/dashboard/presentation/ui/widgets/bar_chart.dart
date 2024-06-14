/// Package import
import 'package:flutter/material.dart';
import 'package:rccg_jp/features/dashboard/presentation/ui/widgets/spline_chart.dart';
import 'package:rccg_jp/features/donations/data/models/donation_amount.dart';
import 'package:rccg_jp/src/extensions/extensions.dart';
import 'package:rccg_jp/src/extensions/int.dart';
import 'package:rccg_jp/src/extensions/new_donation.dart';
/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChartWidget extends StatefulWidget {
  final Map<DateTime, List<NewDonation>> groupedDonations;

  const BarChartWidget({super.key, required this.groupedDonations});

  @override
  State<BarChartWidget> createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget> {
  TooltipBehavior? _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildDefaultColumnChart();
  }

  /// Get default column chart
  SfCartesianChart _buildDefaultColumnChart() {
    bool isCardView = true;
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(
          text: isCardView ? '' : 'Population growth of various countries'),
      primaryXAxis: const CategoryAxis(
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          axisLine: AxisLine(width: 0),

          /*axisLabelFormatter: (value) {
            return ChartAxisLabel(
                value.value.toDouble().toFiatCurrencyFormat(decimalDigits: 0),
                TextStyle());
          },*/
          labelFormat: '{value}',
          majorTickLines: MajorTickLines(size: 0)),
      series: _getDefaultColumnSeries(),
      tooltipBehavior: _tooltipBehavior,
    );
  }

  /// Get default column series
  List<ColumnSeries<ChartSampleData, String>> _getDefaultColumnSeries() {
    List<ChartSampleData> data = [];
    widget.groupedDonations.forEach((date,donations){
      data.add(ChartSampleData(x: date, y: donations.totalAmount));
    });
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        color: context.surfaceTint,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        width: 0.4,
        dataSource:data /*List.generate(widget.groupedDonations.length, (e) {
          // for (int i = 0; i < widget.groupedDonations.length; i++) {
          // data.add(
          return ChartSampleData(
              x: widget.groupedDonations[e]?.isNotEmpty == true
                  ? widget.groupedDonations[e]?.first.donatedAt
                  : e.monthDateTime,
              y: widget.groupedDonations[e]?.totalAmount ?? 0.0);
          //);
          // }
          //  return data;
        }).toList()*/,
/*

    ChartSampleData(x: 'Jan', y: 0.541),
    ChartSampleData(x: 'Feb', y: 0.818),
    ChartSampleData(x: 'Mar', y: 1.51),
    ChartSampleData(x: 'Apr', y: 1.302),
    ChartSampleData(x: 'May', y: 2.017),
    ChartSampleData(x: 'Jun', y: 1.683),
    ],*/
        xValueMapper: (ChartSampleData sales, _) =>
            (sales.x as DateTime).monthShort,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        dataLabelSettings: const DataLabelSettings(
            isVisible: true, textStyle: TextStyle(fontSize: 10)),
      )
    ];
  }
}
