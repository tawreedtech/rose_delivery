import 'package:flutter/material.dart';
import 'package:rose_delivery/features/language/domain/models/language_model.dart';
import 'package:rose_delivery/utill/app_constants.dart';

class LanguageRepository {
  List<LanguageModel> getAllLanguages({BuildContext? context}) {
    return AppConstants.languages;
  }
}
