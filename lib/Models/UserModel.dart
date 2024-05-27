class UserModel {
  String id;
  String? Email;
  String? fullName;
  String? address;
  String? phoneNo;
  String? profileImage;

  UserModel(
      {
      this.id = '',
      required this.Email,
      this.fullName,
      this.address,
      this.profileImage,
      this.phoneNo,
      });

  UserModel.fromjson(Map<String, dynamic> json)
      : this(
    Email: json["Email"],
      id: json["id"],
    fullName: json["fullName"],
    address: json["address"],
      profileImage: json["profileImage"],
      phoneNo: json["phoneNo"],
  );

  Map<String, dynamic> Tojson() {
    return {
      "id": id,
      "Email": Email,
      "fullName": fullName,
      "address": address,
      "profileImage": profileImage,
      "phoneNo": phoneNo,
    };
  }
}
