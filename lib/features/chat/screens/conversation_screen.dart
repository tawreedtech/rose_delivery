import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rose_delivery/common/basewidgets/custom_loader_widget.dart';
import 'package:rose_delivery/common/basewidgets/paginated_list_view_widget.dart';
import 'package:rose_delivery/features/chat/controllers/chat_controller.dart';
import 'package:rose_delivery/features/profile/controllers/profile_controller.dart';
import 'package:rose_delivery/features/chat/domain/models/chat_model.dart';
import 'package:rose_delivery/utill/dimensions.dart';
import 'package:rose_delivery/common/basewidgets/custom_app_bar_widget.dart';
import 'package:rose_delivery/common/basewidgets/no_data_screen_widget.dart';
import 'package:rose_delivery/features/chat/widgets/chat_header_widget.dart';
import 'package:rose_delivery/features/chat/widgets/conversation_item_card_widget.dart';
import 'package:rose_delivery/features/profile/widgets/profile_info_widget.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({Key? key}) : super(key: key);

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Get.find<ChatController>().getConversationList(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
      appBar: CustomAppBarWidget(title: 'message'.tr),
      body: GetBuilder<ChatController>(builder: (chatController) {

        ChatModel? _conversation;
        if(chatController.conversationModel != null) {
          _conversation = chatController.conversationModel;
        }else {
          _conversation = chatController.conversationModel;
        }

        return Column(children: [

          Container(height: 180,decoration: BoxDecoration(color: Theme.of(context).primaryColor,
              borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(Dimensions.paddingSizeOverLarge),
                  bottomRight: Radius.circular(Dimensions.paddingSizeOverLarge))),
            padding:  EdgeInsets.symmetric(vertical:Dimensions.paddingSizeExtraSmall),
            child:  Column(children:  [
                GetBuilder<ProfileController>(
                  builder: (profileController) => ProfileInfoWidget(profileModel: profileController.profileModel,isChat: true)),
                const ChatHeaderWidget()])),

           SizedBox(height:  Dimensions.paddingSizeSmall),

          (chatController.conversationModel != null && !chatController.isLoading) ? chatController.conversationModel!.chat!.isNotEmpty ?
          Expanded(child:  RefreshIndicator(
              onRefresh: () async => chatController.getConversationList(1),
              child: Scrollbar(child: SingleChildScrollView(controller: _scrollController,
                  child: Center(child: SizedBox(width: 1170,
                      child:  Padding(padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                        child: PaginatedListViewWidget(
                          reverse: false,
                          scrollController: _scrollController,
                          onPaginate: (int? offset) => chatController.getConversationList(offset!),
                          totalSize: _conversation!.totalSize,
                          offset: int.parse(_conversation.offset!),
                          enabledPagination: chatController.conversationModel == null,
                          itemView: ListView.builder(
                            itemCount: _conversation.chat!.length,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => ConversationItemCardWidget(chat: _conversation!.chat![index]))))))))),
          ) :const NoDataScreenWidget(): CustomLoaderWidget(height: Get.height-500),
        ]);
      }),
    );
  }
}
