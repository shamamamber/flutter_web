class ElectricianModel {
  String name;
  String contact;
  String email;
  String address;
  String description;

  ElectricianModel({
    required this.name,
    required this.contact,
    required this.email,
    required this.address,
    required this.description,
  });
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'contact': contact,
      'email': email,
      'address': address,
      'description': description,
    };
  }
}