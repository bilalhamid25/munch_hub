class HomeModel {
  int? id;
  int? role;
  String? firstName;
  String? lastName;
  String? email;
  String? decryptPassword;
  String? phone;
  String? contactPhone;
  String? country;
  String? latitude;
  String? longitude;
  String? suit;
  String? state;
  String? city;
  String? address;
  String? mapsAddress;
  String? zip;
  String? profileImg;
  String? companyName;
  String? companyWebsite;
  int? status;
  String? userId;
  String? roleRights;
  String? slug;
  String? logo;
  String? createdAt;
  String? updatedAt;
  double? distance;

  HomeModel(
      {this.id,
      this.role,
      this.firstName,
      this.lastName,
      this.email,
      this.decryptPassword,
      this.phone,
      this.contactPhone,
      this.country,
      this.latitude,
      this.longitude,
      this.suit,
      this.state,
      this.city,
      this.address,
      this.mapsAddress,
      this.zip,
      this.profileImg,
      this.companyName,
      this.companyWebsite,
      this.status,
      this.userId,
      this.roleRights,
      this.slug,
      this.logo,
      this.createdAt,
      this.updatedAt,
      this.distance});

  HomeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    decryptPassword = json['decrypt_password'];
    phone = json['phone'];
    contactPhone = json['contact_phone'];
    country = json['country'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    suit = json['suit'];
    state = json['state'];
    city = json['city'];
    address = json['address'];
    mapsAddress = json['maps_address'];
    zip = json['zip'];
    profileImg = json['profile_img'];
    companyName = json['company_name'];
    companyWebsite = json['company_website'];
    status = json['status'];
    userId = json['user_id'];
    roleRights = json['role_rights'];
    slug = json['slug'];
    logo = json['logo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['role'] = role;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['decrypt_password'] = decryptPassword;
    data['phone'] = phone;
    data['contact_phone'] = contactPhone;
    data['country'] = country;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['suit'] = suit;
    data['state'] = state;
    data['city'] = city;
    data['address'] = address;
    data['maps_address'] = mapsAddress;
    data['zip'] = zip;
    data['profile_img'] = profileImg;
    data['company_name'] = companyName;
    data['company_website'] = companyWebsite;
    data['status'] = status;
    data['user_id'] = userId;
    data['role_rights'] = roleRights;
    data['slug'] = slug;
    data['logo'] = logo;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['distance'] = distance;
    return data;
  }
}
