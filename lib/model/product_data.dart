import 'dart:convert';
/// status : "success"
/// data : {"startech":{"productName":"A4TECH OP-620D 2X Click Optical Mouse","description":"2X Optical Mouse\nDPI: 800DPI\nDIM: 4.68L x 2.48W x 1.39H in.","price":"480৳","availability":"In Stock","productUrl":"https://www.startech.com.bd/a4tech-op-620d","siteName":"Startech","imgSrc":null},"techland":{"productName":"Not Found","description":"Not Found","price":"","availability":"Out of Stock","productUrl":null,"siteName":"Techland","imgSrc":null},"skyland":{"productName":"A4 Tech 3300N Wireless Keyboard With Padless Mouse","description":"Specification:Comfortable full-size keyboard and easy-to-carry mouse with snap-on wireless receiver increase freedom,\nso you can work comfortab..","price":"1,299৳","availability":"In Stock","productUrl":"https://www.skyland.com.bd/a4-tech-3300n-wireless-keyboard-with-padless-mouse?search=A4%20Tech","siteName":"Skyland","imgSrc":"https://www.skyland.com.bd/image/cache/catalog/Images/Banner/sslcommerz-payment-260x157.jpg.webp"},"minPrice":{"minPrice":480,"minSitename":"Startech"}}

ProductData productDataFromJson(String str) => ProductData.fromJson(json.decode(str));
String productDataToJson(ProductData data) => json.encode(data.toJson());
class ProductData {
  ProductData({
      String? status, 
      Data? data,}){
    _status = status;
    _data = data;
}

  ProductData.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  Data? _data;
ProductData copyWith({  String? status,
  Data? data,
}) => ProductData(  status: status ?? _status,
  data: data ?? _data,
);
  String? get status => _status;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// startech : {"productName":"A4TECH OP-620D 2X Click Optical Mouse","description":"2X Optical Mouse\nDPI: 800DPI\nDIM: 4.68L x 2.48W x 1.39H in.","price":"480৳","availability":"In Stock","productUrl":"https://www.startech.com.bd/a4tech-op-620d","siteName":"Startech","imgSrc":null}
/// techland : {"productName":"Not Found","description":"Not Found","price":"","availability":"Out of Stock","productUrl":null,"siteName":"Techland","imgSrc":null}
/// skyland : {"productName":"A4 Tech 3300N Wireless Keyboard With Padless Mouse","description":"Specification:Comfortable full-size keyboard and easy-to-carry mouse with snap-on wireless receiver increase freedom,\nso you can work comfortab..","price":"1,299৳","availability":"In Stock","productUrl":"https://www.skyland.com.bd/a4-tech-3300n-wireless-keyboard-with-padless-mouse?search=A4%20Tech","siteName":"Skyland","imgSrc":"https://www.skyland.com.bd/image/cache/catalog/Images/Banner/sslcommerz-payment-260x157.jpg.webp"}
/// minPrice : {"minPrice":480,"minSitename":"Startech"}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      Startech? startech, 
      Techland? techland, 
      Skyland? skyland, 
      MinPrice? minPrice,}){
    _startech = startech;
    _techland = techland;
    _skyland = skyland;
    _minPrice = minPrice;
}

  Data.fromJson(dynamic json) {
    _startech = json['startech'] != null ? Startech.fromJson(json['startech']) : null;
    _techland = json['techland'] != null ? Techland.fromJson(json['techland']) : null;
    _skyland = json['skyland'] != null ? Skyland.fromJson(json['skyland']) : null;
    _minPrice = json['minPrice'] != null ? MinPrice.fromJson(json['minPrice']) : null;
  }
  Startech? _startech;
  Techland? _techland;
  Skyland? _skyland;
  MinPrice? _minPrice;
Data copyWith({  Startech? startech,
  Techland? techland,
  Skyland? skyland,
  MinPrice? minPrice,
}) => Data(  startech: startech ?? _startech,
  techland: techland ?? _techland,
  skyland: skyland ?? _skyland,
  minPrice: minPrice ?? _minPrice,
);
  Startech? get startech => _startech;
  Techland? get techland => _techland;
  Skyland? get skyland => _skyland;
  MinPrice? get minPrice => _minPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_startech != null) {
      map['startech'] = _startech?.toJson();
    }
    if (_techland != null) {
      map['techland'] = _techland?.toJson();
    }
    if (_skyland != null) {
      map['skyland'] = _skyland?.toJson();
    }
    if (_minPrice != null) {
      map['minPrice'] = _minPrice?.toJson();
    }
    return map;
  }

}

/// minPrice : 480
/// minSitename : "Startech"

MinPrice minPriceFromJson(String str) => MinPrice.fromJson(json.decode(str));
String minPriceToJson(MinPrice data) => json.encode(data.toJson());
class MinPrice {
  MinPrice({
      num? minPrice, 
      String? minSitename,}){
    _minPrice = minPrice;
    _minSitename = minSitename;
}

  MinPrice.fromJson(dynamic json) {
    _minPrice = json['minPrice'];
    _minSitename = json['minSitename'];
  }
  num? _minPrice;
  String? _minSitename;
MinPrice copyWith({  num? minPrice,
  String? minSitename,
}) => MinPrice(  minPrice: minPrice ?? _minPrice,
  minSitename: minSitename ?? _minSitename,
);
  num? get minPrice => _minPrice;
  String? get minSitename => _minSitename;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['minPrice'] = _minPrice;
    map['minSitename'] = _minSitename;
    return map;
  }

}

/// productName : "A4 Tech 3300N Wireless Keyboard With Padless Mouse"
/// description : "Specification:Comfortable full-size keyboard and easy-to-carry mouse with snap-on wireless receiver increase freedom,\nso you can work comfortab.."
/// price : "1,299৳"
/// availability : "In Stock"
/// productUrl : "https://www.skyland.com.bd/a4-tech-3300n-wireless-keyboard-with-padless-mouse?search=A4%20Tech"
/// siteName : "Skyland"
/// imgSrc : "https://www.skyland.com.bd/image/cache/catalog/Images/Banner/sslcommerz-payment-260x157.jpg.webp"

Skyland skylandFromJson(String str) => Skyland.fromJson(json.decode(str));
String skylandToJson(Skyland data) => json.encode(data.toJson());
class Skyland {
  Skyland({
      String? productName, 
      String? description, 
      String? price, 
      String? availability, 
      String? productUrl, 
      String? siteName, 
      String? imgSrc,}){
    _productName = productName;
    _description = description;
    _price = price;
    _availability = availability;
    _productUrl = productUrl;
    _siteName = siteName;
    _imgSrc = imgSrc;
}

  Skyland.fromJson(dynamic json) {
    _productName = json['productName'];
    _description = json['description'];
    _price = json['price'];
    _availability = json['availability'];
    _productUrl = json['productUrl'];
    _siteName = json['siteName'];
    _imgSrc = json['imgSrc'];
  }
  String? _productName;
  String? _description;
  String? _price;
  String? _availability;
  String? _productUrl;
  String? _siteName;
  String? _imgSrc;
Skyland copyWith({  String? productName,
  String? description,
  String? price,
  String? availability,
  String? productUrl,
  String? siteName,
  String? imgSrc,
}) => Skyland(  productName: productName ?? _productName,
  description: description ?? _description,
  price: price ?? _price,
  availability: availability ?? _availability,
  productUrl: productUrl ?? _productUrl,
  siteName: siteName ?? _siteName,
  imgSrc: imgSrc ?? _imgSrc,
);
  String? get productName => _productName;
  String? get description => _description;
  String? get price => _price;
  String? get availability => _availability;
  String? get productUrl => _productUrl;
  String? get siteName => _siteName;
  String? get imgSrc => _imgSrc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productName'] = _productName;
    map['description'] = _description;
    map['price'] = _price;
    map['availability'] = _availability;
    map['productUrl'] = _productUrl;
    map['siteName'] = _siteName;
    map['imgSrc'] = _imgSrc;
    return map;
  }

}

/// productName : "Not Found"
/// description : "Not Found"
/// price : ""
/// availability : "Out of Stock"
/// productUrl : null
/// siteName : "Techland"
/// imgSrc : null

Techland techlandFromJson(String str) => Techland.fromJson(json.decode(str));
String techlandToJson(Techland data) => json.encode(data.toJson());
class Techland {
  Techland({
      String? productName, 
      String? description, 
      String? price, 
      String? availability, 
      dynamic productUrl, 
      String? siteName, 
      dynamic imgSrc,}){
    _productName = productName;
    _description = description;
    _price = price;
    _availability = availability;
    _productUrl = productUrl;
    _siteName = siteName;
    _imgSrc = imgSrc;
}

  Techland.fromJson(dynamic json) {
    _productName = json['productName'];
    _description = json['description'];
    _price = json['price'];
    _availability = json['availability'];
    _productUrl = json['productUrl'];
    _siteName = json['siteName'];
    _imgSrc = json['imgSrc'];
  }
  String? _productName;
  String? _description;
  String? _price;
  String? _availability;
  dynamic _productUrl;
  String? _siteName;
  dynamic _imgSrc;
Techland copyWith({  String? productName,
  String? description,
  String? price,
  String? availability,
  dynamic productUrl,
  String? siteName,
  dynamic imgSrc,
}) => Techland(  productName: productName ?? _productName,
  description: description ?? _description,
  price: price ?? _price,
  availability: availability ?? _availability,
  productUrl: productUrl ?? _productUrl,
  siteName: siteName ?? _siteName,
  imgSrc: imgSrc ?? _imgSrc,
);
  String? get productName => _productName;
  String? get description => _description;
  String? get price => _price;
  String? get availability => _availability;
  dynamic get productUrl => _productUrl;
  String? get siteName => _siteName;
  dynamic get imgSrc => _imgSrc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productName'] = _productName;
    map['description'] = _description;
    map['price'] = _price;
    map['availability'] = _availability;
    map['productUrl'] = _productUrl;
    map['siteName'] = _siteName;
    map['imgSrc'] = _imgSrc;
    return map;
  }

}

/// productName : "A4TECH OP-620D 2X Click Optical Mouse"
/// description : "2X Optical Mouse\nDPI: 800DPI\nDIM: 4.68L x 2.48W x 1.39H in."
/// price : "480৳"
/// availability : "In Stock"
/// productUrl : "https://www.startech.com.bd/a4tech-op-620d"
/// siteName : "Startech"
/// imgSrc : null

Startech startechFromJson(String str) => Startech.fromJson(json.decode(str));
String startechToJson(Startech data) => json.encode(data.toJson());
class Startech {
  Startech({
      String? productName, 
      String? description, 
      String? price, 
      String? availability, 
      String? productUrl, 
      String? siteName, 
      dynamic imgSrc,}){
    _productName = productName;
    _description = description;
    _price = price;
    _availability = availability;
    _productUrl = productUrl;
    _siteName = siteName;
    _imgSrc = imgSrc;
}

  Startech.fromJson(dynamic json) {
    _productName = json['productName'];
    _description = json['description'];
    _price = json['price'];
    _availability = json['availability'];
    _productUrl = json['productUrl'];
    _siteName = json['siteName'];
    _imgSrc = json['imgSrc'];
  }
  String? _productName;
  String? _description;
  String? _price;
  String? _availability;
  String? _productUrl;
  String? _siteName;
  dynamic _imgSrc;
Startech copyWith({  String? productName,
  String? description,
  String? price,
  String? availability,
  String? productUrl,
  String? siteName,
  dynamic imgSrc,
}) => Startech(  productName: productName ?? _productName,
  description: description ?? _description,
  price: price ?? _price,
  availability: availability ?? _availability,
  productUrl: productUrl ?? _productUrl,
  siteName: siteName ?? _siteName,
  imgSrc: imgSrc ?? _imgSrc,
);
  String? get productName => _productName;
  String? get description => _description;
  String? get price => _price;
  String? get availability => _availability;
  String? get productUrl => _productUrl;
  String? get siteName => _siteName;
  dynamic get imgSrc => _imgSrc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productName'] = _productName;
    map['description'] = _description;
    map['price'] = _price;
    map['availability'] = _availability;
    map['productUrl'] = _productUrl;
    map['siteName'] = _siteName;
    map['imgSrc'] = _imgSrc;
    return map;
  }

}