import 'package:rccg_jp/lib.dart';
import 'package:rccg_jp/src/extensions/extensions.dart';
import 'package:rccg_jp/src/widgets/margin.dart';
import 'package:rccg_jp/src/widgets/text.dart';

enum PaymentStatus { notStarted, inProgress, completed }

class StatusCard extends StatelessWidget {
  final PaymentStatus status;

  const StatusCard({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        KText(
          'Status',
          fontSize: 14.sp,
          color: context.outline,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: switch (status) {
                PaymentStatus.notStarted => context.errorContainer,
                PaymentStatus.inProgress =>
                  const Color(0xffEB833C).withOpacity(0.2),
                PaymentStatus.completed =>
                  const Color(0xff7FC09C).withOpacity(0.2),
              }),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
            child: Row(
              children: [
                Icon(
                  switch (status) {
                    PaymentStatus.notStarted => Icons.cancel_outlined,
                    PaymentStatus.inProgress => Icons.timelapse_outlined,
                    PaymentStatus.completed => Icons.check_circle_outlined,
                  },
                  color: switch (status) {
                    PaymentStatus.notStarted => context.error,
                    PaymentStatus.inProgress => const Color(0xffEB833C),
                    PaymentStatus.completed => const Color(0xff7FC09C),
                  },
                ),
                RowSpacing(4.w),
                KText(
                  switch (status) {
                    PaymentStatus.notStarted => 'Not started',
                    PaymentStatus.inProgress => 'In progress',
                    PaymentStatus.completed => 'Completed',
                    // Icons.timelapse, // switch (status) {
                  },
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: switch (status) {
                    PaymentStatus.notStarted => context.error,
                    PaymentStatus.inProgress => const Color(0xffEB833C),
                    PaymentStatus.completed => const Color(0xff7FC09C),
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
