import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rccg_jp/core/services/storage/storage.dart';

//storage providers
final storeProvider = Provider(
  (ref) {
    return Storage();
  },
);

//firebase auth providers

//firebase firestore providers
final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);

