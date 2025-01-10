class MemberModel {
  int id = 1;
  String phone = '';
  String email = '';
  String firstName = '';
  String middleName = '';
  String lastName = '';
  String dateOfBirth = '';
  int age = 0;
  String gender = '';
  String voterId = '';
  String aadharCard = '';
  String referralCode = '';
  String addressLine1 = '';
  String addressLine2 = '';
  String cityOrVillage = '';
  String taluka = '';
  String district = '';
  String state = '';
  String pincode = '';
  String username = '';
  String password = '';
  String pin = '';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone': phone,
      'email': email,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth,
      'age': age,
      'gender': gender,
      'voterId': voterId,
      'aadharCard': aadharCard,
      'referralCode': referralCode,
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
      'cityOrVillage': cityOrVillage,
      'taluka': taluka,
      'district': district,
      'state': state,
      'pincode': pincode,
      'username': username,
      'password': password,
      'pin': pin,
    };
  }
}
