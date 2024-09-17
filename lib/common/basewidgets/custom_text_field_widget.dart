import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rose_delivery/utill/color_resources.dart';
import 'package:rose_delivery/utill/dimensions.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final Color? fillColor;
  final int maxLines;
  final bool isPassword;
  final bool isCountryPicker;
  final bool isShowBorder;
  final bool isIcon;
  final bool isShowSuffixIcon;
  final bool isShowPrefixIcon;
  final bool noBg;
  final Function? onTap;
  final String? suffixIconUrl;
  final String? prefixIconUrl;
  final bool isSearch;
  final bool isDisable;
  final bool noPadding;
  final Function? onChanged;


  const CustomTextFieldWidget(
      {Key? key, this.hintText = 'Write something...',
      this.controller,
      this.focusNode,
      this.nextFocus,
      this.inputType = TextInputType.text,
      this.inputAction = TextInputAction.next,
      this.maxLines = 1,
      this.fillColor,
      this.isCountryPicker = false,
      this.isShowBorder = false,
      this.isShowSuffixIcon = false,
      this.isShowPrefixIcon = false,
      this.onTap,
      this.isIcon = false,
      this.isPassword = false,
      this.suffixIconUrl,
      this.prefixIconUrl,
      this.isSearch = false,
        this.isDisable = true,
        this.noBg = false,
        this.noPadding = false,
        this.onChanged,
      }) : super(key: key);

  @override
  _CustomTextFieldWidgetState createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.topSpace),
              border: Border.all(color: widget.isShowBorder ? Get.isDarkMode? Theme.of(context).hintColor.withOpacity(.5):Theme.of(context).primaryColor.withOpacity(.125) : Colors.transparent)),
          child: TextField(
           enabled: widget.isDisable,
            maxLines: widget.maxLines,
            controller: widget.controller,
            focusNode: widget.focusNode,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Theme.of(context).highlightColor, fontSize: Dimensions.fontSizeDefault),
            textInputAction: widget.inputAction,
            keyboardType: widget.inputType,
            cursorColor: Get.isDarkMode ? Theme.of(context).primaryColorLight : Theme.of(context).primaryColor,
            obscureText: widget.isPassword ? _obscureText : false,
            decoration: InputDecoration(contentPadding:  EdgeInsets.symmetric(vertical: Get.context!.width <= 400? 14 : 16, horizontal: 22),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(Dimensions.topSpace),
                borderSide: const BorderSide(style: BorderStyle.none, width: 0)),
              isDense: true,
              hintText: widget.hintText,
              fillColor: widget.fillColor ?? Theme.of(context).canvasColor,
              hintStyle: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: Dimensions.fontSizeDefault,
                  color:Get.isDarkMode? Theme.of(context).hintColor.withOpacity(.5): ColorResources.colorGreyChateau),
              filled: true,
              prefixIcon: widget.isShowPrefixIcon ?
              Padding(padding:  EdgeInsets.only(left: Dimensions.paddingSizeLarge, right: Dimensions.paddingSizeSmall),
                child: Image.asset(widget.prefixIconUrl!),) :
              widget.noBg ? Image.asset(widget.prefixIconUrl!,color: widget.isDisable? Theme.of(context).primaryColor: Theme.of(context).hintColor) : const SizedBox.shrink(),
              prefixIconConstraints:  BoxConstraints(minWidth:  widget.noPadding ? 5 : 50, maxHeight: Get.context!.width <= 400? 15: 20),
              suffixIcon: widget.isShowSuffixIcon ?
              widget.isPassword ?
              IconButton(icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility , color: Theme.of(context).highlightColor),
                  onPressed: _toggle) : widget.isIcon ?
              Padding(padding:  EdgeInsets.only(left: Dimensions.paddingSizeLarge, right: Dimensions.paddingSizeSmall),
                child: Image.asset(widget.suffixIconUrl!, width: 15, height: 15,),) : null : null),
            onTap: widget.onTap as void Function()?,
            onSubmitted: (text) => widget.nextFocus != null ? FocusScope.of(context).requestFocus(widget.nextFocus) : null,
            onChanged: widget.onChanged as void Function(String)?,
          ),
        ),
        widget.isShowPrefixIcon?
        Container(width: 50, height: 53, decoration: BoxDecoration(
          color:Get.isDarkMode? Theme.of(context).hintColor.withOpacity(.5): Theme.of(context).primaryColor.withOpacity(.125),
          borderRadius:  BorderRadius.only(topLeft: Radius.circular(Dimensions.topSpace),bottomLeft: Radius.circular(Dimensions.topSpace))
        )):const SizedBox()
      ],
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
