import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:quiz_app/utils/images_and_icons/app_images_icons.dart';
import '../models/subjectmodel.dart';

class DataRepository {

  DataRepository._();

  static final DataRepository instance = DataRepository._();

  factory DataRepository() => instance;

  static List<SubjectModel> allSubject = [];

  Future<void> loadSubject() async {
    var data = await rootBundle.loadString(AppIconsAndImages.data);
    var decodeData = jsonDecode(data);
    allSubject = (decodeData["data"] as List?)
        ?.map((e) => SubjectModel.fromJson(e))
        .toList() ??
        [];
  }
}

