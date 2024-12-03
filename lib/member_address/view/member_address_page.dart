// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:member_repository/member_repository.dart';
// import '../bloc/member_address_bloc.dart';
// import 'bloc/member_address_bloc.dart';
//
// class MemberAddressPage extends StatelessWidget {
//   const MemberAddressPage({Key? key}) : super(key: key);
//
//   /// Define a static route for navigation
//   static Route route() {
//     return MaterialPageRoute<void>(
//       builder: (_) => const MemberAddressPage(),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Member Address'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: BlocProvider(
//           create: (context) => MemberAddressBloc(
//             memberRepository: context.read<MemberRepository>(),
//           ),
//           child: const MemberAddressView(),
//         ),
//       ),
//     );
//   }
// }
//
// class MemberAddressView extends StatelessWidget {
//   const MemberAddressView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Member Address Form Goes Here',
//         styles: Theme.of(context).textTheme.titleLarge,
//       ),
//     );
//   }
// }
