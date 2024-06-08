import 'package:rccg_jp/lib.dart';
import 'package:rccg_jp/src/extensions/extensions.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DoughnutChart extends StatelessWidget {
  const DoughnutChart({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildElevationDoughnutChart(context);
  }

  SfCircularChart _buildElevationDoughnutChart(BuildContext context) {
    return SfCircularChart(
      margin: EdgeInsets.zero,

      /// It used to set the annotation on circular chart.
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          height: '100%',
          width: '100%',
          widget: PhysicalModel(
            shape: BoxShape.circle,
            elevation: 10,
            color: context.onPrimary,
            child: Container(),
          ),
        ),
        CircularChartAnnotation(
            widget: Text('60%\nComplete',
                textAlign: TextAlign.center,
                style: TextStyle(color: context.primary, fontSize: 12)))
      ],
      /*title: ChartTitle(
          text:  'Progress of donation',
          textStyle: const TextStyle(fontSize: 20)),*/
      series: _getElevationDoughnutSeries(context),
    );
  }

  /// Returns the doughnut series which need to be center elevation.
  List<DoughnutSeries<ChartSampleData, String>> _getElevationDoughnutSeries(
      BuildContext context) {
    return <DoughnutSeries<ChartSampleData, String>>[
      DoughnutSeries<ChartSampleData, String>(
          radius: '55%',
          dataSource: <ChartSampleData>[
            ChartSampleData(x: 'A', y: 62, pointColor: context.primary),
            ChartSampleData(
                x: 'B',
                y: 38,
                pointColor: context.onSecondary)
          ],
          animationDuration: 1,
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          pointColorMapper: (ChartSampleData data, _) => data.pointColor)
    ];
  }
}

class ChartSampleData {
  ChartSampleData({this.x, required this.y, required this.pointColor});

  final dynamic x;
  final num y;
  final Color pointColor;
}
