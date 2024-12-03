// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:formz/formz.dart';
//
// import 'member_address_event.dart';
// import 'member_address_event.dart';
// import 'member_address_event.dart';
// import 'member_address_event.dart';
// import 'member_address_event.dart';
// import 'member_address_event.dart';
// import 'member_address_state.dart';
//
//
//
//
// class MemberAddressBloc extends Bloc<MemberAddressEvent, MemberAddressState> {
//   MemberAddressBloc() : super(const MemberAddressState());
//
//   @override
//   Stream<MemberAddressState> mapEventToState(MemberAddressEvent event) async* {
//     if (event is HouseOrFlatNoChanged) {
//       yield* _mapHouseOrFlatNoChangedToState(event.houseOrFlatNo);
//     } else if (event is BuildingNameChanged) {
//       yield* _mapBuildingNameChangedToState(event.buildingName);
//     } else if (event is StreetChanged) {
//       yield* _mapStreetChangedToState(event.street);
//     } else if (event is AreaChanged) {
//       yield* _mapAreaChangedToState(event.area);
//     } else if (event is LandmarkChanged) {
//       yield* _mapLandmarkChangedToState(event.landmark);
//     } else if (event is CityOrVillageChanged) {
//       yield* _mapCityOrVillageChangedToState(event.cityOrVillage);
//     } else if (event is TalukaChanged) {
//       yield* _mapTalukaChangedToState(event.taluka);
//     } else if (event is DistrictChanged) {
//       yield* _mapDistrictChangedToState(event.district);
//     } else if (event is StateChanged) {
//       yield* _mapStateChangedToState(event.state);
//     } else if (event is PincodeChanged) {
//       yield* _mapPincodeChangedToState(event.pincode);
//     } else if (event is FormSubmitted) {
//       yield* _mapFormSubmittedToState(state);
//     }
//   }
//
//   // Handlers for each field change event:
//   Stream<MemberAddressState> _mapHouseOrFlatNoChangedToState(String houseOrFlatNo) async* {
//     yield state.copyWith(houseOrFlatNo: HouseOrFlatNo.dirty(houseOrFlatNo));
//   }
//
//   Stream<MemberAddressState> _mapBuildingNameChangedToState(String buildingName) async* {
//     yield state.copyWith(buildingName: BuildingName.dirty(buildingName));
//   }
//
//   Stream<MemberAddressState> _mapStreetChangedToState(String street) async* {
//     yield state.copyWith(street: Street.dirty(street));
//   }
//
//   Stream<MemberAddressState> _mapAreaChangedToState(String area) async* {
//     yield state.copyWith(area: Area.dirty(area));
//   }
//
//   Stream<MemberAddressState> _mapLandmarkChangedToState(String landmark) async* {
//     yield state.copyWith(landmark: Landmark.dirty(landmark));
//   }
//
//   Stream<MemberAddressState> _mapCityOrVillageChangedToState(String cityOrVillage) async* {
//     yield state.copyWith(cityOrVillage: CityOrVillage.dirty(cityOrVillage));
//   }
//
//   Stream<MemberAddressState> _mapTalukaChangedToState(String taluka) async* {
//     yield state.copyWith(taluka: Taluka.dirty(taluka));
//   }
//
//   Stream<MemberAddressState> _mapDistrictChangedToState(String district) async* {
//     yield state.copyWith(district: District.dirty(district));
//   }
//
//   Stream<MemberAddressState> _mapStateChangedToState(String stateValue) async* {
//     yield state.copyWith(state: MemberState.dirty(stateValue));
//   }
//
//
//
//   Stream<MemberAddressState> _mapPincodeChangedToState(String pincode) async* {
//     yield state.copyWith(pincode: Pincode.dirty(pincode));
//   }
//
//   Stream<MemberAddressState> _mapFormSubmittedToState(MemberAddressState currentState) async* {
//     // Example: You can check if all fields are valid before allowing submission
//     final isValid = currentState.houseOrFlatNo.isValid &&
//         currentState.buildingName.isValid &&
//         currentState.street.isValid &&  // Make sure .isValid exists on street
//         currentState.area.isValid &&
//         currentState.landmark.isValid &&
//         currentState.cityOrVillage.isValid &&
//         currentState.taluka.isValid &&
//         currentState.district.isValid &&
//         currentState.state.isValid &&  // Make sure .isValid exists on state
//         currentState.pincode.isValid; // Ensure .isValid exists on pincode
//
//     if (isValid) {
//       yield currentState.copyWith(status: FormzStatus.submissionSuccess);
//     } else {
//       yield currentState.copyWith(status: FormzStatus.submissionFailure);
//     }
//   }
// }
//
//
