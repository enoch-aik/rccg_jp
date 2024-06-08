import 'package:rccg_jp/features/donations/data/models/donor.dart';
import 'package:rccg_jp/features/donations/presentation/ui/widgets/status_card.dart';
import 'package:rccg_jp/src/extensions/extensions.dart';
import 'package:rccg_jp/src/extensions/new_donation.dart';

extension DonationExtension on Donor {
  PaymentStatus getStatus() {
    double totalAmountDonated = donations.totalAmount;
    if (totalAmountDonated <= 0) {
      return PaymentStatus.notStarted;
    } else if (totalAmountDonated < pledgedAmount) {
      return PaymentStatus.inProgress;
    } else if (totalAmountDonated >= pledgedAmount) {
      return PaymentStatus.completed;
    } else {
      return PaymentStatus.notStarted;
    }
  }

  //get the progress value of the donation
  double getProgressValue() {
    double totalAmountDonated = donations.totalAmount;
    double progressValue = (totalAmountDonated / pledgedAmount);
    //in a case where the total amount donated is greater than the pledged amount
    if (progressValue > 1) {
      return 1;
    }
    return progressValue.toTwoDP;
  }
}
