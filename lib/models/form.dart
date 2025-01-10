class UserData {
  String? qualification;
  String? profession;
  String? position;
  String? password;
  String? username;
  String? firstName;
  String? middleName;
  String? lastName;
  String? title;
  String? email;
  String? gender;
  String? phone;
  String? dateOfBirth;
  String? addressLine1;
  String? addressLine2;
  String? cityOrVillage;
  String? state;
  String? pincode;
  String? district;
  String? taluka;
  String? referralCode;
  String? voterID;
  String? voterCard;
  String? aadhaarCard;
  String? aadhaarNumber;

  UserData({
    this.qualification,
    this.profession,
    this.position,
    this.password,
    this.username,
    this.firstName,
    this.middleName,
    this.lastName,
    this.title,
    this.email,
    this.gender,
    this.phone,
    this.dateOfBirth,
    this.addressLine1,
    this.addressLine2,
    this.cityOrVillage,
    this.state,
    this.pincode,
    this.district,
    this.taluka,
    this.referralCode,
    this.voterID,
    this.voterCard,
    this.aadhaarCard,
    this.aadhaarNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'qualification': qualification,
      'profession': profession,
      'position': position,
      'password': password,
      'username': username,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'title': title,
      'email': email,
      'gender': gender,
      'phone': phone,
      'dateOfBirth': dateOfBirth,
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
      'cityOrVillage': cityOrVillage,
      'state': state,
      'pincode': pincode,
      'district': district,
      'taluka': taluka,
      'referralCode': referralCode,
      'voterID': voterID,
      'voterCard': voterCard,
      'aadhaarCard': aadhaarCard,
      'aadhaarNumber': aadhaarNumber,
    };
  }
}
