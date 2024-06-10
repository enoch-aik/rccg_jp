import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rccg_jp/core/dependency_injection/di_providers.dart';
import 'package:rccg_jp/core/service_exceptions/service_exception.dart';
import 'package:rccg_jp/features/donations/data/data_source/donation_data_source.dart';
import 'package:rccg_jp/features/donations/data/models/donation_amount.dart';
import 'package:rccg_jp/features/donations/data/models/donor.dart';

class DonationDataSourceImpl extends DonationDataSource {
  DonationDataSourceImpl(this._ref);

  final Ref _ref;

  late final _firestore = _ref.watch(firestoreProvider);

  @override
  Future<bool> addDonor(Donor donor) {
    return _firestore
        .collection('donors')
        .doc(donor.id)
        .set(donor.toJson())
        .then((value) {
      return true;
    }).catchError((error) {
      throw const ApiExceptions.fireBaseAuthException(
          'Unexpected error occurred\nUnable to add donor, try again}');
      //  return false;
    });
  }

  @override
  Stream<List<Donor>> getDonors() {
    return _firestore.collection('donors').snapshots().map(
        (event) => event.docs.map((e) => Donor.fromJson(e.data())).toList());
  }

  @override
  Future<bool> addDonation(
      {required NewDonation donation, required Donor updatedDonorInfo}) {
    //update donation in donor details
    _firestore
        .collection('donors')
        .doc(donation.donorId)
        .update(updatedDonorInfo.toJson())
        .catchError((error) {
      throw const ApiExceptions.fireBaseAuthException(
          'Unexpected error occurred\nUnable to update donation, try again}');
    });

    //add donation to general donations
    return _firestore
        .collection('donations')
        .doc('${donation.donorId} ${donation.donationId}')
        .set(donation.toJson())
        .then((value) {
      return true;
    }).catchError((error) {
      throw const ApiExceptions.fireBaseAuthException(
          'Unexpected error occurred\nUnable to update donation, try again}');
    });
  }

  @override
  Stream<List<NewDonation>> getAllDonations() {
    return _firestore.collection('donations').snapshots().map((event) =>
        event.docs.map((e) => NewDonation.fromJson(e.data())).toList());
  }
}
