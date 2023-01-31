import 'package:cloud_firestore/cloud_firestore.dart';

typedef SnapshotMapper<T> = T Function(
    DocumentSnapshot<Map<String, dynamic>> snapshot);
typedef AsyncSnapshotMapper<T> = Future<T> Function(
    DocumentSnapshot<Map<String, dynamic>> snapshot);

extension DocumentSnapshotExt on DocumentSnapshot<Map<String, dynamic>> {
  Map<String, dynamic> getMapped() {
    return {
      'id': id,
      ...dataOrEmpty(),
    };
  }

  Map<String, dynamic> dataOrEmpty() =>
      exists ? data() as Map<String, dynamic> : <String, dynamic>{};

  Future<T> getAsyncMapped<T>(AsyncSnapshotMapper<T> snapshotToModel) async {
    return await snapshotToModel(this);
  }
}

extension DocumentReferenceExt on DocumentReference<Map<String, dynamic>> {
  Future<T> getMapped<T>(SnapshotMapper<T> snapshotToModel) {
    return get().then(snapshotToModel);
  }

  Stream<T> getMappedStream<T>(SnapshotMapper<T> snapshotToModel) {
    return snapshots().map(snapshotToModel);
  }

  Stream<T> getAsyncMappedStream<T>(
    AsyncSnapshotMapper<T> snapshotToModel,
  ) {
    return snapshots().asyncMap(snapshotToModel);
  }
}

extension CollectionReferenceExt on CollectionReference<Map<String, dynamic>> {
  Future<List<T>> getMapped<T>(SnapshotMapper<T> snapshotToModel) {
    return get().then((snap) => snap.getMapped(snapshotToModel));
  }

  Stream<List<T>> getMappedStream<T>(SnapshotMapper<T> snapshotToModel) {
    return snapshots().map((snap) => snap.getMapped(snapshotToModel));
  }
}

extension QuerySnapshotExt on QuerySnapshot<Map<String, dynamic>> {
  List<T> getMapped<T>(SnapshotMapper<T> snapshotToModel) {
    return docs.where((doc) => doc.exists).map(snapshotToModel).toList();
  }

  List<Future<T>> getAsyncMapped<T>(AsyncSnapshotMapper<T> snapshotToModel) {
    return docs.where((doc) => doc.exists).map(snapshotToModel).toList();
  }
}

extension QueryExt on Query<Map<String, dynamic>> {
  Future<List<T>> getMapped<T>(SnapshotMapper<T> snapshotToModel) {
    return get().then((snap) => snap.getMapped(snapshotToModel));
  }

  Stream<List<T>> getMappedStream<T>(SnapshotMapper<T> snapshotToModel) {
    return snapshots().asyncMap((snap) => snap.getMapped(snapshotToModel));
  }

  Stream<List<T>> getAsyncMappedStream<T>(
    AsyncSnapshotMapper<T> snapshotToModel,
  ) {
    return snapshots().asyncMap((snap) async {
      final items = snap.getAsyncMapped(snapshotToModel);
      final mappedItems = <T>[];
      for (final item in items) {
        mappedItems.add(await item);
      }
      return mappedItems;
    });
  }
}
