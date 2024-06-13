import 'package:flutter/widgets.dart';
import 'package:rccg_jp/src/extensions/extensions.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ProgressBarWidget extends StatelessWidget {
  final double totalAmount;

  const ProgressBarWidget({super.key, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    //get the percentage of the total amount
    double percentage = (totalAmount.divide(3000000)).multiply(100);

    return SizedBox(
      height: 148,
      width: 148,
      child: Transform.scale(
        scale: 1,
        child: SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(
              showLabels: false,
              showTicks: false,
              radiusFactor: 0.8,
              axisLineStyle: const AxisLineStyle(
                thickness: 0.2,
                cornerStyle: CornerStyle.bothCurve,
                color: Color.fromARGB(30, 0, 169, 181),
                thicknessUnit: GaugeSizeUnit.factor,
              ),
              pointers: <GaugePointer>[
                RangePointer(
                    value: percentage,
                    cornerStyle: CornerStyle.bothCurve,
                    width: 0.2,
                    color: totalAmount.donationColor,
                    //color: const Color.fromRGBO(3, 218, 198, 1),
                    sizeUnit: GaugeSizeUnit.factor,
                    enableAnimation: true,
                    animationDuration: 20,
                    animationType: AnimationType.linear)
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    positionFactor: 0.1,
                    angle: 90,
                    widget: Text(
                      '${percentage.toTwoDP}%',
                      style: TextStyle(
                          fontSize: 16,
                          color: totalAmount.donationColor,
                          fontWeight: FontWeight.bold),
                    ))
              ])
        ]),
      ),
    );
  }
}
