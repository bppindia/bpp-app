// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:formz/formz.dart';
// import '../bloc/member_address_bloc.dart';
// import '../bloc/member_address_state.dart';
//
// class MemberAddressForm extends StatelessWidget {
//   const MemberAddressForm({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<MemberAddressBloc, MemberAddressState>(
//       listener: (context, state) {
//         if (state.status.isSubmissionFailure) {
//           ScaffoldMessenger.of(context)
//             ..hideCurrentSnackBar()
//             ..showSnackBar(
//               const SnackBar(content: Text('Something went wrong!')),
//             );
//         }
//       },
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             _HouseOrFlatNoInput(),
//             const SizedBox(height: 12.0),
//             _BuildingNameInput(),
//             const SizedBox(height: 12.0),
//             _StreetInput(),
//             const SizedBox(height: 12.0),
//             _AreaInput(),
//             const SizedBox(height: 12.0),
//             _LandmarkInput(),
//             const SizedBox(height: 12.0),
//             _CityOrVillageInput(),
//             const SizedBox(height: 12.0),
//             _TalukaInput(),
//             const SizedBox(height: 12.0),
//             _DistrictInput(),
//             const SizedBox(height: 12.0),
//             _StateInput(),
//             const SizedBox(height: 12.0),
//             _PincodeInput(),
//             const SizedBox(height: 12.0),
//             Row(
//               children: [
//                 _SubmitButton(),
//                 const SizedBox(width: 8.0),
//                 _CancelButton(),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // Input Widgets
// class _HouseOrFlatNoInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MemberAddressBloc, MemberAddressState>(
//       buildWhen: (previous, current) =>
//       previous.houseOrFlatNo != current.houseOrFlatNo,
//       builder: (context, state) {
//         return TextField(
//           onChanged: (value) =>
//               context.read<MemberAddressBloc>().add(HouseOrFlatNoChanged(value)),
//           decoration: InputDecoration(
//             labelText: 'House or Flat Number',
//             errorText: state.houseOrFlatNo.invalid
//                 ? state.houseOrFlatNo.error?.message
//                 : null,
//           ),
//         );
//       },
//     );
//   }
// }
//
// class _BuildingNameInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MemberAddressBloc, MemberAddressState>(
//       buildWhen: (previous, current) =>
//       previous.buildingName != current.buildingName,
//       builder: (context, state) {
//         return TextField(
//           onChanged: (value) =>
//               context.read<MemberAddressBloc>().add(BuildingNameChanged(value)),
//           decoration: InputDecoration(
//             labelText: 'Building Name',
//             errorText: state.buildingName.invalid
//                 ? state.buildingName.error?.message
//                 : null,
//           ),
//         );
//       },
//     );
//   }
// }
//
// class _StreetInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MemberAddressBloc, MemberAddressState>(
//       buildWhen: (previous, current) => previous.street != current.street,
//       builder: (context, state) {
//         return TextField(
//           onChanged: (value) =>
//               context.read<MemberAddressBloc>().add(StreetChanged(value)),
//           decoration: InputDecoration(
//             labelText: 'Street',
//             errorText: state.street.invalid
//                 ? state.street.error?.message
//                 : null,
//           ),
//         );
//       },
//     );
//   }
// }
//
// class _AreaInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MemberAddressBloc, MemberAddressState>(
//       buildWhen: (previous, current) => previous.area != current.area,
//       builder: (context, state) {
//         return TextField(
//           onChanged: (value) =>
//               context.read<MemberAddressBloc>().add(AreaChanged(value)),
//           decoration: InputDecoration(
//             labelText: 'Area',
//             errorText: state.area.invalid
//                 ? state.area.error?.message
//                 : null,
//           ),
//         );
//       },
//     );
//   }
// }
//
// class _LandmarkInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MemberAddressBloc, MemberAddressState>(
//       buildWhen: (previous, current) => previous.landmark != current.landmark,
//       builder: (context, state) {
//         return TextField(
//           onChanged: (value) =>
//               context.read<MemberAddressBloc>().add(LandmarkChanged(value)),
//           decoration: InputDecoration(
//             labelText: 'Landmark',
//             errorText: state.landmark.invalid
//                 ? state.landmark.error?.message
//                 : null,
//           ),
//         );
//       },
//     );
//   }
// }
//
// class _CityOrVillageInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MemberAddressBloc, MemberAddressState>(
//       buildWhen: (previous, current) =>
//       previous.cityOrVillage != current.cityOrVillage,
//       builder: (context, state) {
//         return TextField(
//           onChanged: (value) =>
//               context.read<MemberAddressBloc>().add(CityOrVillageChanged(value)),
//           decoration: InputDecoration(
//             labelText: 'City or Village',
//             errorText: state.cityOrVillage.invalid
//                 ? state.cityOrVillage.error?.message
//                 : null,
//           ),
//         );
//       },
//     );
//   }
// }
//
// class _TalukaInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MemberAddressBloc, MemberAddressState>(
//       buildWhen: (previous, current) => previous.taluka != current.taluka,
//       builder: (context, state) {
//         return TextField(
//           onChanged: (value) =>
//               context.read<MemberAddressBloc>().add(TalukaChanged(value)),
//           decoration: InputDecoration(
//             labelText: 'Taluka',
//             errorText: state.taluka.invalid
//                 ? state.taluka.error?.message
//                 : null,
//           ),
//         );
//       },
//     );
//   }
// }
//
// class _DistrictInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MemberAddressBloc, MemberAddressState>(
//       buildWhen: (previous, current) => previous.district != current.district,
//       builder: (context, state) {
//         return TextField(
//           onChanged: (value) =>
//               context.read<MemberAddressBloc>().add(DistrictChanged(value)),
//           decoration: InputDecoration(
//             labelText: 'District',
//             errorText: state.district.invalid
//                 ? state.district.error?.message
//                 : null,
//           ),
//         );
//       },
//     );
//   }
// }
//
// class _StateInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MemberAddressBloc, MemberAddressState>(
//       buildWhen: (previous, current) => previous.state != current.state,
//       builder: (context, state) {
//         return TextField(
//           onChanged: (value) =>
//               context.read<MemberAddressBloc>().add(MemberStateChanged(value)),
//           decoration: InputDecoration(
//             labelText: 'State',
//             errorText: state.state.invalid
//                 ? state.state.error?.message
//                 : null,
//           ),
//         );
//       },
//     );
//   }
// }
//
// class _PincodeInput extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MemberAddressBloc, MemberAddressState>(
//       buildWhen: (previous, current) => previous.pincode != current.pincode,
//       builder: (context, state) {
//         return TextField(
//           onChanged: (value) =>
//               context.read<MemberAddressBloc>().add(PincodeChanged(value)),
//           decoration: InputDecoration(
//             labelText: 'Pincode',
//             errorText: state.pincode.invalid
//                 ? state.pincode.error?.message
//                 : null,
//           ),
//         );
//       },
//     );
//   }
// }
//
// // Buttons
// class _SubmitButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MemberAddressBloc, MemberAddressState>(
//       buildWhen: (previous, current) => previous.status != current.status,
//       builder: (context, state) {
//         return state.status.isSubmissionInProgress
//             ? const CircularProgressIndicator()
//             : ElevatedButton(
//           onPressed: state.status.isValidated
//               ? () => context.read<MemberAddressBloc>().add(FormSubmitted())
//               : null,
//           child: const Text('SUBMIT'),
//         );
//       },
//     );
//   }
// }
//
// class _CancelButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () => Navigator.pop(context),
//       child: const Text('CANCEL'),
//     );
//   }
// }
