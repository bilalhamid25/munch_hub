class RestaurantDetailModel {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? contactPhone;
  String? latitude;
  String? longitude;
  String? suit;
  String? city;
  String? address;
  String? zip;
  String? companyWebsite;
  String? logo;
  String? profileImg;
  String? description;

  RestaurantDetailModel(
      {id,
      name,
      phone,
      email,
      contactPhone,
      latitude,
      longitude,
      suit,
      city,
      address,
      zip,
      companyWebsite,
      logo,
      profileImg,
      description});

  RestaurantDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    contactPhone = json['contact_phone'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    suit = json['suit'];
    city = json['city'];
    address = json['address'];
    zip = json['zip'];
    companyWebsite = json['company_website'];
    logo = json['logo'];
    profileImg = json['profile_img'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['contact_phone'] = contactPhone;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['suit'] = suit;
    data['city'] = city;
    data['address'] = address;
    data['zip'] = zip;
    data['company_website'] = companyWebsite;
    data['logo'] = logo;
    data['profile_img'] = profileImg;
    data['description'] = description;
    return data;
  }
}
