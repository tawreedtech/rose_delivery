import 'package:get/get_connect/http/src/response/response.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rose_delivery/data/api/api_client.dart';
import 'package:rose_delivery/utill/app_constants.dart';

class RiderRepository {
  final ApiClient apiClient;

  RiderRepository({required this.apiClient});

  Future<Response> getDistanceInMeter(LatLng from, LatLng to) async {
    return await apiClient.postData(AppConstants.distanceApi, {
      'origin_lat': from.latitude,
      'origin_lng': from.longitude,
      'destination_lat': to.latitude,
      'destination_lng': to.longitude
    });
  }

}
