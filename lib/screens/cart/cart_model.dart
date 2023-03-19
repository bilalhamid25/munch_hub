class CartModel {
  int? count;
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

  CartModel(
      {this.count,
      this.id,
      this.name,
      this.description,
      this.sellItemOwn,
      this.hidequantityonreceipt,
      this.categories,
      this.price,
      this.tax,
      this.isStock,
      this.temprature,
      this.image,
      this.dietaryAttributes,
      this.modifierItems,
      this.energyValue});

  CartModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    id = json['id'];
    name = json['name'];
    description = json['description'];
    sellItemOwn = json['sell_item_own'];
    hidequantityonreceipt = json['hidequantityonreceipt'];
    categories = json['categories'];
    price =
        json['price'] != null ? double.parse(json['price'].toString()) : 0.0;
    tax = json['tax'];
    isStock = json['is_stock'];
    temprature = json['temprature'];
    image = json['image'];
    dietaryAttributes = json['dietary_attributes'];
    modifierItems = json['modifier_items'];
    energyValue = json['energy_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['count'] = count ?? 0;
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
