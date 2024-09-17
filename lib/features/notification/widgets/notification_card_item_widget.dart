import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rose_delivery/features/notification/domain/models/notifications_model.dart';
import 'package:rose_delivery/helper/date_converter.dart';
import 'package:rose_delivery/utill/dimensions.dart';
import 'package:rose_delivery/utill/images.dart';
import 'package:rose_delivery/utill/styles.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationCardWidget extends StatelessWidget {
  final Notifications? notificationModel;
  final bool addTitle;
  const NotificationCardWidget({Key? key, this.notificationModel, this.addTitle = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Padding(padding:  EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault,Dimensions.paddingSizeExtraSmall,
          Dimensions.paddingSizeDefault,Dimensions.paddingSizeExtraSmall),
      child: Container(decoration: BoxDecoration(color: Theme.of(context).primaryColor.withOpacity(.05),
          borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

          addTitle ?  Padding(padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Text(DateConverter.dateTimeStringToDateOnly(notificationModel!.createdAt!))) : const SizedBox(),

          ListTile(
            leading: Container(width: 40, padding:  EdgeInsets.all(Dimensions.paddingSizeSmall),
                decoration: BoxDecoration(color: Get.isDarkMode? Theme.of(context).hintColor.withOpacity(.25) :
                Theme.of(context).primaryColor.withOpacity(.125),
                  borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall)),
                child: Image.asset(Images.notIcon)),



            title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('${'order'.tr} # ${notificationModel!.orderId.toString()}',
                  style: rubikMedium.copyWith(fontSize: Dimensions.fontSizeSmall)),

                Row(children: [
                    Text(timeago.format(DateConverter.isoStringToLocalDate(notificationModel!.updatedAt!)),
                      style: rubikRegular.copyWith(fontSize: Dimensions.fontSizeSmall),),

                    Padding(padding:  EdgeInsets.only(left: Dimensions.paddingSizeExtraSmall),
                      child: Icon(Icons.alarm,color: Theme.of(context).hintColor.withOpacity(.35),
                          size: Dimensions.iconSizeDefault))])]),


            subtitle: Text(notificationModel!.description ?? '', maxLines: 1, overflow: TextOverflow.clip,
              style: rubikRegular.copyWith(fontSize: Dimensions.fontSizeSmall))),

        ]),
      ),
    );
  }
}
