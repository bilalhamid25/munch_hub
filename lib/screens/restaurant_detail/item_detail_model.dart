class ItemDetailModel {
  String? id;
  String? description;
  String? sellItemOwn;
  String? hidequantityonreceipt;
  String? categories;
  double? price;
  String? tax;
  String? isStock;
  String? image;
  String? temprature;
  String? dietaryAttributes;
  int? modifierItems;
  String? energyValue;
  List<Modifiers>? modifiers;

  ItemDetailModel(
      {id,
      description,
      sellItemOwn,
      hidequantityonreceipt,
      categories,
      price,
      tax,
      isStock,
      image,
      temprature,
      dietaryAttributes,
      modifierItems,
      energyValue,
      modifiers});

  ItemDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    sellItemOwn = json['sell_item_own'];
    hidequantityonreceipt = json['hidequantityonreceipt'];
    categories = json['categories'];
    price =
        json['price'] != null ? double.parse(json['price'].toString()) : 0.0;
    tax = json['tax'];
    isStock = json['is_stock'];
    image = json['image'];
    temprature = json['temprature'];
    dietaryAttributes = json['dietary_attributes'];
    modifierItems = json['modifier_items'];
    energyValue = json['energy_value'];
    if (json['modifiers'] != null) {
      modifiers = <Modifiers>[];
      json['modifiers'].forEach((v) {
        modifiers!.add(Modifiers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['sell_item_own'] = sellItemOwn;
    data['hidequantityonreceipt'] = hidequantityonreceipt;
    data['categories'] = categories;
    data['price'] = price;
    data['tax'] = tax;
    data['is_stock'] = isStock;
    data['image'] = image;
    data['temprature'] = temprature;
    data['dietary_attributes'] = dietaryAttributes;
    data['modifier_items'] = modifierItems;
    data['energy_value'] = energyValue;
    if (modifiers != null) {
      data['modifiers'] = modifiers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Modifiers {
  int? id;
  int? restaurantId;
  String? name;
  List<Items>? items;
  int? defaultQuantities;
  int? minPermittedTotal;
  int? maxPermittedTotal;
  int? maxPermittedPerOption;
  int? status;
  List<Options>? options;

  Modifiers(
      {id,
      restaurantId,
      name,
      items,
      defaultQuantities,
      minPermittedTotal,
      maxPermittedTotal,
      maxPermittedPerOption,
      status,
      options});

  Modifiers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    restaurantId = json['restaurant_id'];
    name = json['name'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    defaultQuantities = json['default_quantities'];
    minPermittedTotal = json['minPermittedTotal'];
    maxPermittedTotal = json['maxPermittedTotal'];
    maxPermittedPerOption = json['maxPermittedPerOption'];
    status = json['status'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['restaurant_id'] = restaurantId;
    data['name'] = name;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['default_quantities'] = defaultQuantities;
    data['minPermittedTotal'] = minPermittedTotal;
    data['maxPermittedTotal'] = maxPermittedTotal;
    data['maxPermittedPerOption'] = maxPermittedPerOption;
    data['status'] = status;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? item;
  String? price;

  Items({item, price});

  Items.fromJson(Map<String, dynamic> json) {
    item = json['item'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item'] = item;
    data['price'] = price;
    return data;
  }
}

class Options {
  String? name;
  int? price;

  Options({name, price});

  Options.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    return data;
  }
}
