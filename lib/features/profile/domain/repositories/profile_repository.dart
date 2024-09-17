import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rose_delivery/data/api/api_client.dart';
import 'package:rose_delivery/features/profile/domain/repositories/profile_repository_interface.dart';
import 'package:rose_delivery/utill/app_constants.dart';
import 'package:http/http.dart' as http;

class ProfileRepository implements ProfileRepositoryInterface{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  ProfileRepository({required this.apiClient, required this.sharedPreferences});

  @override
  Future<Response> getProfileInfo() async {
    return await apiClient.getData(AppConstants.profileUri);
  }



  @override
  Future<Response> profileStatusOnnOff( int status) async {
    Response _response = await apiClient.postData(AppConstants.statusOnOffUri,
        {
          'is_online': status,
          '_method': "put"
        });
    return _response;
  }


  @override
  Future<Response> resetPassword(String? phone, String password ,String confirmPassword) async {
    Response _response = await apiClient.postData(AppConstants.resetPassword,
        {
          'phone': phone,
          'password' : password,
          'confirm_password': confirmPassword
        });
    return _response;
  }


  @override
  Future<http.StreamedResponse> updateProfile(dynamic userInfoModel, String password, File? file, String token) async {
    http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse('${AppConstants.baseUri}${AppConstants.profileUpdateUri}'));
    request.headers.addAll(<String,String>{'Authorization': 'Bearer $token'});
    if(file != null){
      request.files.add(http.MultipartFile('image', file.readAsBytes().asStream(), file.lengthSync(), filename: file.path.split('/').last));
    }
    Map<String, String> _fields = {};

    _fields.addAll(<String, String>{
      '_method': 'put', 'f_name': userInfoModel.fName!,
      'l_name': userInfoModel.lName!,
      'address': userInfoModel.address!,
      'password': password,
      'confirm_password' : password,
    });

    request.fields.addAll(_fields);
    if (kDebugMode) {
      print('========>$file/${_fields.toString()}');
    }
    http.StreamedResponse response = await request.send();
    return response;
  }

  @override
  Future<Response> updateBankInfo({String? bankName, String? branch, String? accountNumber, String? holderName}) async {
    return apiClient.postData(AppConstants.updateBankInfo,{
      "bank_name": bankName,
      "branch": branch,
      "account_no": accountNumber,
      "holder_name" : holderName,
      "_method": " put"
    });
  }


  @override
  Future add(value) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future delete(int? id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future get(int? id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future getList() {
    // TODO: implement getList
    throw UnimplementedError();
  }

  @override
  Future update(Map<String, dynamic> body, int? id) {
    // TODO: implement update
    throw UnimplementedError();
  }

}
