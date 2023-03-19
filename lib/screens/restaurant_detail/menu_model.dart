class MenuModel {
  String? name;
  int? id;
  String? slug;
  List<Categoryhours>? categoryhours;
  List<Items>? items;

  MenuModel({name, id, slug, categoryhours, items});

  MenuModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    slug = json['slug'];
    if (json['categoryhours'] != null) {
      categoryhours = <Categoryhours>[];
      json['categoryhours'].forEach((v) {
        categoryhours!.add(Categoryhours.fromJson(v));
      });
    }
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['id'] = id;
    data['slug'] = slug;
    if (categoryhours != null) {
      data['categoryhours'] =
          categoryhours!.map((v) => v.toJson()).toList();
    }
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categoryhours {
  int? id;
  String? day;
  String? opentime;
  String? closetime;

  Categoryhours({id, day, opentime, closetime});

  Categoryhours.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    opentime = json['opentime'];
    closetime = json['closetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['day'] = day;
    data['opentime'] = opentime;
    data['closetime'] = closetime;
    return data;
  }
}

class Items {
  int? id;
  String? name;
  String? description;
  String? sellItemOwn;
  int? hidequantityonreceipt;
  String? categories;
  double? price;
  int? tax;
  bool? isStock;
  String? temprature;
  String? image;
  String? dietaryAttributes;
  String? modifierItems;
  String? energyValue;

  Items(
      {id,
      name,
      description,
      sellItemOwn,
      hidequantityonreceipt,
      categories,
      price,
      tax,
      isStock,
      temprature,
      image,
      dietaryAttributes,
      modifierItems,
      energyValue});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    sellItemOwn = json['sell_item_own'];
    hidequantityonreceipt = json['hidequantityonreceipt'];
    categories = json['categories'];
    price = json['price'] != null ? double.parse(json['price'].toString()) : 0.0;
    tax = json['tax'];
    isStock = json['is_stock'];
    temprature = json['temprature'];
    image = json['image'];
    dietaryAttributes = json['dietary_attributes'];
    modifierItems = json['modifier_items'];
    energyValue = json['energy_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  {};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['sell_item_own'] = sellItemOwn;
    data['hidequantityonreceipt'] = hidequantityonreceipt;
    data['categories'] = categories;
    data['price'] = price;
    data['tax'] = tax;
    data['is_stock'] = isStock;
    data['temprature'] = temprature;
    data['image'] = image;
    data['dietary_attributes'] = dietaryAttributes;
    data['modifier_items'] = modifierItems;
    data['energy_value'] = energyValue;
    return data;
  }
}
