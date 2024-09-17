import 'dart:convert';

import 'package:rose_delivery/features/chat/domain/models/message_model.dart';

class ChatModel {
  int? totalSize;
  String? limit;
  String? offset;
  List<Chat>? chat;

  ChatModel({this.totalSize, this.limit, this.offset, this.chat});

  ChatModel.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];
    limit = json['limit'];
    offset = json['offset'];
    if (json['chat'] != null) {
      chat = <Chat>[];
      json['chat'].forEach((v) {
        chat!.add(Chat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_size'] = totalSize;
    data['limit'] = limit;
    data['offset'] = offset;
    if (chat != null) {
      data['chat'] = chat!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chat {
  int? id;
  int? userId;
  int? sellerId;
  String? message;
  bool? sentByCustomer;
  bool? sentBySeller;
  bool? sentByAdmin;
  bool? seenByDeliveryMan;
  String? createdAt;
  Customer? customer;
  SellerInfo? sellerInfo;
  List<String>? attachment;


  Chat(
      {this.id,
        this.userId,
        this.sellerId,
        this.message,
        this.sentByCustomer,
        this.sentBySeller,
        this.sentByAdmin,
        this.seenByDeliveryMan,
        this.createdAt,
        this.customer,
        this.sellerInfo,
        this.attachment
      });

  Chat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    sellerId = json['seller_id'];
    message = json['message'];
    sentByCustomer = json['sent_by_customer'];
    sentBySeller = json['sent_by_seller'];
    sentByAdmin = json['sent_by_admin'];
    if(json['seen_by_delivery_man'] != null){
      seenByDeliveryMan = json['seen_by_delivery_man']??false;
    }

    createdAt = json['created_at'];
    customer = json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    sellerInfo = json['seller_info'] != null ? SellerInfo.fromJson(json['seller_info']) : null;
    if(json['attachment'] != null && json['attachment'] != '[]'){
      attachment =  jsonDecode(json['attachment']).cast<String>();
    }else{
      attachment = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['seller_id'] = sellerId;
    data['message'] = message;
    data['sent_by_customer'] = sentByCustomer;
    data['sent_by_seller'] = sentBySeller;
    data['sent_by_admin'] = sentByAdmin;
    data['seen_by_delivery_man'] = seenByDeliveryMan;
    data['created_at'] = createdAt;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (sellerInfo != null) {
      data['seller_info'] = sellerInfo!.toJson();
    }
    return data;
  }
}


