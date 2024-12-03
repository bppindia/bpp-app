// import 'package:equatable/equatable.dart';
// import 'package:formz/formz.dart';
//
// import '../models/area.dart';
// import '../models/building_name.dart';
// import '../models/city_or_village.dart';
// import '../models/district.dart';
// import '../models/house_or_flat_no.dart';
// import '../models/landmark.dart';
// import '../models/pincode.dart';
// import '../models/state.dart';
// import '../models/street.dart';
// import '../models/taluka.dart';
//
//
//
//
// class MemberAddressState extends Equatable {
//   const MemberAddressState({
//     this.houseOrFlatNo = const HouseOrFlatNo.pure(),
//     this.buildingName = const BuildingName.pure(),
//     this.street = const Street.pure(),
//     this.area = const Area.pure(),
//     this.landmark = const Landmark.pure(),
//     this.cityOrVillage = const CityOrVillage.pure(),
//     this.taluka = const Taluka.pure(),
//     this.district = const District.pure(),
//     this.state = const MemberState.pure(),
//     this.pincode = const Pincode.pure(),
//     this.status = FormzStatus.pure,
//   });
//
//   final HouseOrFlatNo houseOrFlatNo;
//   final BuildingName buildingName;
//   final Street street;
//   final Area area;
//   final Landmark landmark;
//   final CityOrVillage cityOrVillage;
//   final Taluka taluka;
//   final District district;
//   final MemberState state; // Use MemberState instead of State
//   final Pincode pincode;
//   final FormzStatus status;
//
//   MemberAddressState copyWith({
//     HouseOrFlatNo? houseOrFlatNo,
//     BuildingName? buildingName,
//     Street? street,
//     Area? area,
//     Landmark? landmark,
//     CityOrVillage? cityOrVillage,
//     Taluka? taluka,
//     District? district,
//     MemberState? state, // Update type to MemberState
//     Pincode? pincode,
//     FormzStatus? status,
//   }) {
//     return MemberAddressState(
//       houseOrFlatNo: houseOrFlatNo ?? this.houseOrFlatNo,
//       buildingName: buildingName ?? this.buildingName,
//       street: street ?? this.street,
//       area: area ?? this.area,
//       landmark: landmark ?? this.landmark,
//       cityOrVillage: cityOrVillage ?? this.cityOrVillage,
//       taluka: taluka ?? this.taluka,
//       district: district ?? this.district,
//       state: state ?? this.state, // Update type to MemberState
//       pincode: pincode ?? this.pincode,
//       status: status ?? this.status,
//     );
//   }
//
//   @override
//   List<Object> get props => [
//     houseOrFlatNo,
//     buildingName,
//     street,
//     area,
//     landmark,
//     cityOrVillage,
//     taluka,
//     district,
//     state, // Update type to MemberState
//     pincode,
//     status,
//   ];
// }
