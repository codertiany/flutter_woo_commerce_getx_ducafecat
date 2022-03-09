class WpProductPrices {
  WpProductPrices({
    this.price,
    this.regularPrice,
    this.salePrice,
    this.priceRange,
    this.currencyCode,
    this.currencySymbol,
    this.currencyMinorUnit,
    this.currencyDecimalSeparator,
    this.currencyThousandSeparator,
    this.currencyPrefix,
    this.currencySuffix,
  });

  WpProductPrices.fromJson(dynamic json) {
    price = json['price'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    priceRange = json['price_range'];
    currencyCode = json['currency_code'];
    currencySymbol = json['currency_symbol'];
    currencyMinorUnit = json['currency_minor_unit'];
    currencyDecimalSeparator = json['currency_decimal_separator'];
    currencyThousandSeparator = json['currency_thousand_separator'];
    currencyPrefix = json['currency_prefix'];
    currencySuffix = json['currency_suffix'];
  }
  String? price;
  String? regularPrice;
  String? salePrice;
  dynamic priceRange;
  String? currencyCode;
  String? currencySymbol;
  int? currencyMinorUnit;
  String? currencyDecimalSeparator;
  String? currencyThousandSeparator;
  String? currencyPrefix;
  String? currencySuffix;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['price'] = price;
    map['regular_price'] = regularPrice;
    map['sale_price'] = salePrice;
    map['price_range'] = priceRange;
    map['currency_code'] = currencyCode;
    map['currency_symbol'] = currencySymbol;
    map['currency_minor_unit'] = currencyMinorUnit;
    map['currency_decimal_separator'] = currencyDecimalSeparator;
    map['currency_thousand_separator'] = currencyThousandSeparator;
    map['currency_prefix'] = currencyPrefix;
    map['currency_suffix'] = currencySuffix;
    return map;
  }
}
