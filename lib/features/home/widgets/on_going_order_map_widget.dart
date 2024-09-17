
import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rose_delivery/features/live_tracking/controllers/rider_controller.dart';
import 'package:rose_delivery/features/live_tracking/screens/order_tracking_screen.dart';
import 'package:rose_delivery/features/order/domain/models/order_model.dart';
import 'package:rose_delivery/features/splash/controllers/splash_controller.dart';
import 'package:rose_delivery/utill/dimensions.dart';


class OngoingMapWidget extends StatefulWidget {
  final OrderModel? orderModel;
  const OngoingMapWidget({Key? key, this.orderModel}) : super(key: key);

  @override
  State<OngoingMapWidget> createState() => _OngoingMapWidgetState();
}

class _OngoingMapWidgetState extends State<OngoingMapWidget> {
  @override
  Widget build(BuildContext context) {

    return GetBuilder<RiderController>(
        builder: (riderController) {

          return Padding(padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
            child: Column(children: [

                Container(height: 200,width: Get.width,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.paddingSizeDefault)),

                    child: Stack(clipBehavior: Clip.none, children: [
                        CustomGoogleMapMarkerBuilder(
                            customMarkers: riderController.customMarkers,
                            builder: (context, markers) {
                              return GoogleMap(mapType: MapType.normal,
                                initialCameraPosition:  CameraPosition(target:  riderController.initialPosition, zoom: 16),
                                onMapCreated: (GoogleMapController controller){
                                  riderController.mapController = controller;
                                },
                                minMaxZoomPreference: const MinMaxZoomPreference(0, 15),
                                markers: Set<Marker>.of(markers ?? []),
                                polylines: Set<Polyline>.of(riderController.polylines.values),
                                zoomControlsEnabled: false,
                                compassEnabled: false,
                                indoorViewEnabled: true,
                                mapToolbarEnabled: true,
                                onCameraIdle: () {
                                },
                                onCameraMove: ((_position) => _position),
                              );
                            }
                        ),

                      Get.find<SplashController>().configModel!.mapApiStatus == 1 ?
                        Positioned(child: Align(alignment: Alignment.topRight,
                            child: GestureDetector(onTap: () => Get.to(()=> OrderLiveTrackingScreen(orderModel: widget.orderModel)),
                              child: Padding(padding:  EdgeInsets.all(Dimensions.paddingSizeDefault),
                                child: Container(padding:  EdgeInsets.symmetric(horizontal : Dimensions.paddingSizeDefault,
                                    vertical: Dimensions.paddingSizeExtraSmall),
                                  decoration: BoxDecoration(color: Theme.of(context).cardColor.withOpacity(.5),
                                      borderRadius: BorderRadius.circular(Dimensions.paddingSizeDefault),
                                      border: Border.all(color: Theme.of(context).primaryColor.withOpacity(.5))),
                                  child: Text('view_on_map'.tr)))))) : const SizedBox(),

                      ],
                    )),
              ],
            ),
          );
        }
    );
  }
}