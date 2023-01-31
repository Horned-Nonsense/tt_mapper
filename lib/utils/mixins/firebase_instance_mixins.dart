import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

mixin FirebaseInstanceMixin {
  @protected
  final firestore = FirebaseFirestore.instance;
  @protected
  final firebaseAuth = FirebaseAuth.instance;
  @protected
  final storage = FirebaseStorage.instance;
  @protected
  final fbDynamicLinks = FirebaseDynamicLinks.instance;
}
