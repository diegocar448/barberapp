class Company {
  int? id;
  String? name;
  String? address;
  String? latitude;
  String? longitude;
  String? phone;
  String? socialLink;
  String? image;

  Company(
      {this.id,
      this.name,
      this.address,
      this.latitude,
      this.longitude,
      this.phone,
      this.socialLink,
      this.image});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    phone = json['phone'];
    socialLink = json['social_link'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['phone'] = this.phone;
    data['social_link'] = this.socialLink;
    data['image'] = this.image;
    return data;
  }
}
