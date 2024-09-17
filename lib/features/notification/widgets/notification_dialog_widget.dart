
import 'package:flutter/material.dart';
import 'package:rose_delivery/features/notification/domain/models/notifications_model.dart';
import 'package:rose_delivery/utill/dimensions.dart';
import 'package:rose_delivery/utill/images.dart';
import 'package:rose_delivery/utill/styles.dart';


class NotificationDialogWidget extends StatelessWidget {
  final Notifications notificationModel;
  const NotificationDialogWidget({Key? key, required this.notificationModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child:  SizedBox(width: 400,
        child: Column(mainAxisSize: MainAxisSize.min, children: [

            Align(alignment: Alignment.centerRight, child: IconButton(icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop())),

            Container(height: 150, width: MediaQuery.of(context).size.width,
              margin:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
                  color: Theme.of(context).primaryColor.withOpacity(0.20)),
              child: ClipRRect(borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
                child: Image.asset(Images.delivery))),
             SizedBox(height: Dimensions.paddingSizeLarge),

            Padding(padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
              child: Text(notificationModel.orderId.toString(),
                textAlign: TextAlign.center,
                style: rubikMedium.copyWith(color: Theme.of(context).primaryColor, fontSize: Dimensions.fontSizeLarge))),

            Padding(padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Text(notificationModel.description!, textAlign: TextAlign.center,
                style: rubikRegular.copyWith(color: Theme.of(context).disabledColor))),
          ],
        ),
      ),
    );
  }
}
