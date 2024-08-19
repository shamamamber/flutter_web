class UserModel{
String name;
String contact;
String email;
String password;

UserModel({
  required this.name,
  required this.contact,
  required this.email,
  required this.password,
});

Map<String, dynamic> toMap() {
  return {
    'name': name,
    'contact': contact,
    'email': email,
    'password': password,
  };
}
factory UserModel.fromMap(Map<String, dynamic> map) {
  return UserModel(
    name: map['name'],
    contact: map['contact'],
    email: map['email'],
    password: map['password'],
  );
}

}