

class ConfigModel {
  int? _systemDefaultCurrency;
  bool? _digitalPayment;
  BaseUrls? _baseUrls;
  StaticUrls? _staticUrls;
  String? _aboutUs;
  String? _privacyPolicy;
  List<Faq>? _faq;
  String? _termsConditions;
  List<CurrencyList>? _currencyList;
  String? _currencySymbolPosition;
  bool? _maintenanceMode;
  List<String>? _language;
  List<Colors>? _colors;
  List<String>? _unit;
  String? _shippingMethod;
  String? _currencyModel;
  bool? _emailVerification;
  bool? _phoneVerification;
  String? _countryCode;
  List<SocialLogin>? _socialLogin;
  String? _forgotPasswordVerification;
  String? _companyPhone;
  String? _companyEmail;
  int? _decimalPointSetting;
  String? _companyLogo;
  // ImageFullUrl? _companyLogoImage;
    String? _companyLogoImage;

  String? _companyIcon;
  int? imageUpload;
  int? orderVerification;
  int? _mapApiStatus;
  DefaultLocation? defaultLocation;
  // ImageFullUrl? companyFavIcon;
  String? companyFavIcon;

  ConfigModel(
      {int? systemDefaultCurrency,
        bool? digitalPayment,
        BaseUrls? baseUrls,
        StaticUrls? staticUrls,
        String? aboutUs,
        String? privacyPolicy,
        List<Faq>? faq,
        String? termsConditions,
        List<CurrencyList>? currencyList,
        String? currencySymbolPosition,
        bool? maintenanceMode,
        List<String>? language,
        List<Colors>? colors,
        List<String>? unit,
        String? shippingMethod,
        String? currencyModel,
        bool? emailVerification,
        bool? phoneVerification,
        String? countryCode,
        List<SocialLogin>? socialLogin,
        String? forgotPasswordVerification,
        String? companyPhone,
        String? companyEmail,
        int? decimalPointSetting,
        String? companyLogo,
        // ImageFullUrl? companyLogoImage,
        String? companyLogoImage,
        String? companyIcon,
        int? imageUpload,
        int? orderVerification,
        int? mapApiStatus,

      }) {
    _systemDefaultCurrency = systemDefaultCurrency;
    _digitalPayment = digitalPayment;
    _baseUrls = baseUrls;
    _staticUrls = staticUrls;
    _aboutUs = aboutUs;
    _privacyPolicy = privacyPolicy;
    _faq = faq;
    _termsConditions = termsConditions;
    _currencyList = currencyList;
    _currencySymbolPosition = currencySymbolPosition;
    _maintenanceMode = maintenanceMode;
    _language = language;
    _colors = colors;
    _unit = unit;
    _shippingMethod = shippingMethod;
    _currencyModel = currencyModel;
    _emailVerification = emailVerification;
    _phoneVerification = phoneVerification;
    _countryCode = countryCode;
    _socialLogin = socialLogin;
    _forgotPasswordVerification = forgotPasswordVerification;
    if (companyPhone != null) {
      _companyPhone = companyPhone;
    }
    if (companyEmail != null) {
      _companyEmail = companyEmail;
    }
    _decimalPointSetting = decimalPointSetting;
    _companyLogo = companyLogo;
    _companyLogoImage = companyLogoImage;
    _companyIcon = companyIcon;
    this.imageUpload;
    this.orderVerification;
    _mapApiStatus = mapApiStatus;
    defaultLocation;
    companyFavIcon;

  }

  int? get systemDefaultCurrency => _systemDefaultCurrency;
  bool? get digitalPayment => _digitalPayment;
  BaseUrls? get baseUrls => _baseUrls;
  StaticUrls? get staticUrls => _staticUrls;
  String? get aboutUs => _aboutUs;
  String? get privacyPolicy => _privacyPolicy;
  List<Faq>? get faq => _faq;
  String? get termsConditions => _termsConditions;
  List<CurrencyList>? get currencyList => _currencyList;
  String? get currencySymbolPosition => _currencySymbolPosition;
  bool? get maintenanceMode => _maintenanceMode;
  List<String>? get language => _language;
  List<Colors>? get colors => _colors;
  List<String>? get unit => _unit;
  String? get shippingMethod => _shippingMethod;
  String? get currencyModel => _currencyModel;
  bool? get emailVerification => _emailVerification;
  bool? get phoneVerification => _phoneVerification;
  String? get countryCode =>_countryCode;
  List<SocialLogin>? get socialLogin => _socialLogin;
  String? get forgotPasswordVerification => _forgotPasswordVerification;
  String? get companyPhone => _companyPhone;
  String? get companyEmail => _companyEmail;
  int? get decimalPointSetting => _decimalPointSetting;
  String? get companyLogo => _companyLogo;
  // ImageFullUrl? get companyLogoImage => _companyLogoImage;
   String? get companyLogoImage => _companyLogoImage;
  String? get companyIcon => _companyIcon;
  int? get mapApiStatus => _mapApiStatus;

  ConfigModel.fromJson(Map<String, dynamic> json) {
    _systemDefaultCurrency = json['system_default_currency'];
    _digitalPayment = json['digital_payment'];
    _baseUrls = json['base_urls'] != null
        ? BaseUrls.fromJson(json['base_urls'])
        : null;
    _staticUrls = json['static_urls'] != null
        ? StaticUrls.fromJson(json['static_urls'])
        : null;
    _aboutUs = json['about_us'];
    _privacyPolicy = json['privacy_policy'];
   if (json['faq'] != null) {
      _faq = [];
      json['faq'].forEach((v) {_faq!.add(Faq.fromJson(v));
      });
    }
    _termsConditions = json['terms_&_conditions'];
    if (json['currency_list'] != null) {
      _currencyList = [];
      json['currency_list'].forEach((v) {_currencyList!.add(CurrencyList.fromJson(v));
      });
    }
    _currencySymbolPosition = json['currency_symbol_position'];
    _maintenanceMode = json['maintenance_mode'];
    _language = json['language'].cast<String>();
    if (json['colors'] != null) {
      _colors = [];
      json['colors'].forEach((v) {_colors!.add(Colors.fromJson(v));
      });
    }

    _unit = json['unit'].cast<String>();
    _shippingMethod = json['shipping_method'];
    _currencyModel = json['currency_model'];
    _emailVerification = json['email_verification'];
    _phoneVerification = json['phone_verification'];
    _countryCode = json['country_code'];
    if (json['social_login'] != null) {
      _socialLogin = [];
      json['social_login'].forEach((v) { _socialLogin!.add(SocialLogin.fromJson(v)); });
    }
    _forgotPasswordVerification = json['forgot_password_verification'];
    _companyPhone = json['company_phone'].toString();
    _companyEmail = json['company_email'];
    if(json['decimal_point_settings'] != null && json['decimal_point_settings'] != "" ){
      _decimalPointSetting = int.parse(json['decimal_point_settings'].toString());
    }
    //_companyLogo =json['company_logo']??'';
    _companyLogoImage = json['company_logo'];

    //_companyIcon = json['company_fav_icon'] ?? '';
    if(json['upload_picture_on_delivery'] != null){
      try{
        imageUpload = json['upload_picture_on_delivery'];
      }catch(e){
        imageUpload = int.parse(json['upload_picture_on_delivery'].toString());
      }
    }
    if(json['order_verification'] != null){
      try{
        orderVerification = json['order_verification'];
      }catch(e){
        orderVerification = int.parse(json['order_verification'].toString());
      }
    }
    _mapApiStatus = int.parse(json['map_api_status'].toString());

    defaultLocation = json['default_location'] != null
        ? DefaultLocation.fromJson(json['default_location'])
        : null;

    companyFavIcon = json['company_fav_icon'];

  }

}

class BaseUrls {
  String? _productImageUrl;
  String? _productThumbnailUrl;
  String? _brandImageUrl;
  String? _customerImageUrl;
  String? _bannerImageUrl;
  String? _categoryImageUrl;
  String? _reviewImageUrl;
  String? _sellerImageUrl;
  String? _shopImageUrl;
  String? _notificationImageUrl;
  String? _deliverymanImageUrl;

  BaseUrls(
      {String? productImageUrl,
        String? productThumbnailUrl,
        String? brandImageUrl,
        String? customerImageUrl,
        String? bannerImageUrl,
        String? categoryImageUrl,
        String? reviewImageUrl,
        String? sellerImageUrl,
        String? shopImageUrl,
        String? notificationImageUrl,
        String? deliverymanImageUrl,
      }) {
    _productImageUrl = productImageUrl;
    _productThumbnailUrl = productThumbnailUrl;
    _brandImageUrl = brandImageUrl;
    _customerImageUrl = customerImageUrl;
    _bannerImageUrl = bannerImageUrl;
    _categoryImageUrl = categoryImageUrl;
    _reviewImageUrl = reviewImageUrl;
    _sellerImageUrl = sellerImageUrl;
    _shopImageUrl = shopImageUrl;
    _notificationImageUrl = notificationImageUrl;
    _deliverymanImageUrl = deliverymanImageUrl;
  }

  String? get productImageUrl => _productImageUrl;
  String? get productThumbnailUrl => _productThumbnailUrl;
  String? get brandImageUrl => _brandImageUrl;
  String? get customerImageUrl => _customerImageUrl;
  String? get bannerImageUrl => _bannerImageUrl;
  String? get categoryImageUrl => _categoryImageUrl;
  String? get reviewImageUrl => _reviewImageUrl;
  String? get sellerImageUrl => _sellerImageUrl;
  String? get shopImageUrl => _shopImageUrl;
  String? get notificationImageUrl => _notificationImageUrl;
  String? get deliverymanImageUrl => _deliverymanImageUrl;


  BaseUrls.fromJson(Map<String, dynamic> json) {
    _productImageUrl = json['product_image_url'];
    _productThumbnailUrl = json['product_thumbnail_url'];
    _brandImageUrl = json['brand_image_url'];
    _customerImageUrl = json['customer_image_url'];
    _bannerImageUrl = json['banner_image_url'];
    _categoryImageUrl = json['category_image_url'];
    _reviewImageUrl = json['review_image_url'];
    _sellerImageUrl = json['seller_image_url'];
    _shopImageUrl = json['shop_image_url'];
    _notificationImageUrl = json['notification_image_url'];
    _deliverymanImageUrl = json['delivery_man_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_image_url'] = _productImageUrl;
    data['product_thumbnail_url'] = _productThumbnailUrl;
    data['brand_image_url'] = _brandImageUrl;
    data['customer_image_url'] = _customerImageUrl;
    data['banner_image_url'] = _bannerImageUrl;
    data['category_image_url'] = _categoryImageUrl;
    data['review_image_url'] = _reviewImageUrl;
    data['seller_image_url'] = _sellerImageUrl;
    data['shop_image_url'] = _shopImageUrl;
    data['notification_image_url'] = _notificationImageUrl;
    data['delivery_man_image_url'] = _deliverymanImageUrl;
    return data;
  }
}

class StaticUrls {
  String? _contactUs;
  String? _brands;
  String? _categories;
  String? _customerAccount;

  StaticUrls(
      {String? contactUs,
        String? brands,
        String? categories,
        String? customerAccount}) {
    _contactUs = contactUs;
    _brands = brands;
    _categories = categories;
    _customerAccount = customerAccount;
  }

  String? get contactUs => _contactUs;
  String? get brands => _brands;
  String? get categories => _categories;
  String? get customerAccount => _customerAccount;


  StaticUrls.fromJson(Map<String, dynamic> json) {
    _contactUs = json['contact_us'];
    _brands = json['brands'];
    _categories = json['categories'];
    _customerAccount = json['customer_account'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contact_us'] = _contactUs;
    data['brands'] = _brands;
    data['categories'] = _categories;
    data['customer_account'] = _customerAccount;
    return data;
  }
}

class SocialLogin {
  String? _loginMedium;
  bool? _status;

  SocialLogin({String? loginMedium, bool? status}) {
    _loginMedium = loginMedium;
    _status = status;
  }

  String? get loginMedium => _loginMedium;
  bool? get status => _status;

  SocialLogin.fromJson(Map<String, dynamic> json) {
    _loginMedium = json['login_medium'];
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['login_medium'] = _loginMedium;
    data['status'] = _status;
    return data;
  }
}

class Faq {
  int? _id;
  String? _question;
  String? _answer;
  int? _ranking;
  int? _status;
  String? _createdAt;
  String? _updatedAt;

  Faq(
      {int? id,
        String? question,
        String? answer,
        int? ranking,
        int? status,
        String? createdAt,
        String? updatedAt}) {
    _id = id;
    _question = question;
    _answer = answer;
    _ranking = ranking;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  int? get id => _id;
  String? get question => _question;
  String? get answer => _answer;
  int? get ranking => _ranking;
  int? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;


  Faq.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _question = json['question'];
    _answer = json['answer'];
    _ranking = json['ranking'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['question'] = _question;
    data['answer'] = _answer;
    data['ranking'] = _ranking;
    data['status'] = _status;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}

class CurrencyList {
  int? _id;
  String? _name;
  String? _symbol;
  String? _code;
  double? _exchangeRate;
  String? _createdAt;
  String? _updatedAt;

  CurrencyList(
      {int? id,
        String? name,
        String? symbol,
        String? code,
        double? exchangeRate,
        int? status,
        String? createdAt,
        String? updatedAt}) {
    _id = id;
    _name = name;
    _symbol = symbol;
    _code = code;
    _exchangeRate = exchangeRate;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  int? get id => _id;
  String? get name => _name;
  String? get symbol => _symbol;
  String? get code => _code;
  double? get exchangeRate => _exchangeRate;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;


  CurrencyList.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _symbol = json['symbol'];
    _code = json['code'];
    if(json['exchange_rate'] != null){
      try{
        _exchangeRate = json['exchange_rate'].toDouble();
      }catch(e){
        _exchangeRate = double.parse(json['exchange_rate'].toString());
      }
    }

    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

}

class Colors {
  int? _id;
  String? _name;
  String? _code;
  String? _createdAt;
  String? _updatedAt;

  Colors(
      {int? id, String? name, String? code, String? createdAt, String? updatedAt}) {
    _id = id;
    _name = name;
    _code = code;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  int? get id => _id;
  String? get name => _name;
  String? get code => _code;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;


  Colors.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _code = json['code'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['code'] = _code;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}


class DefaultLocation {
  String? lat;
  String? lng;

  DefaultLocation({this.lat, this.lng});

  DefaultLocation.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}
