import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rccg_jp/core/services/storage/storage.dart';

//storage providers
final storeProvider = Provider(
  (ref) {
    return Storage();
  },
);
