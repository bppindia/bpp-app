// import 'package:flutter/material.dart';
// import 'dart:typed_data';
//
// class DocumentUploadState {
//   String? aadhaarFrontFileName;
//   String? aadhaarBackFileName;
//   String? voterFrontFileName;
//   String? voterBackFileName;
//   Uint8List? aadhaarFrontBytes;
//   Uint8List? aadhaarBackBytes;
//   Uint8List? voterFrontBytes;
//   Uint8List? voterBackBytes;
//
//   bool get hasCompleteAadhaar =>
//       aadhaarFrontFileName != null && aadhaarBackFileName != null;
//
//   bool get hasCompleteVoter =>
//       voterFrontFileName != null && voterBackFileName != null;
// }
//
// class DocumentUploadSection extends StatelessWidget {
//   final TextEditingController aadhaarController;
//   final TextEditingController voterIdController;
//   final DocumentUploadState documentState;
//   final Function(DocumentUploadState) onStateChanged;
//
//   const DocumentUploadSection({
//     Key? key,
//     required this.aadhaarController,
//     required this.voterIdController,
//     required this.documentState,
//     required this.onStateChanged,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CustomTextField(
//           label: "Aadhar Number",
//           hint: "ex.2189 6735 2740",
//           controller: aadhaarController,
//         ),
//         SizedBox(height: 16),
//         FileUploadField(
//           label: "Aadhaar Card Front",
//           onFilePicked: (fileName, fileBytes) {
//             documentState.aadhaarFrontFileName = fileName;
//             documentState.aadhaarFrontBytes = fileBytes;
//             onStateChanged(documentState);
//           },
//           fileName: documentState.aadhaarFrontFileName,
//         ),
//         SizedBox(height: 16),
//         FileUploadField(
//           label: "Aadhaar Card Back",
//           onFilePicked: (fileName, fileBytes) {
//             documentState.aadhaarBackFileName = fileName;
//             documentState.aadhaarBackBytes = fileBytes;
//             onStateChanged(documentState);
//           },
//           fileName: documentState.aadhaarBackFileName,
//         ),
//         _buildDivider(),
//         CustomTextField(
//           label: "Voter ID",
//           hint: "Enter Voter ID",
//           controller: voterIdController,
//         ),
//         SizedBox(height: 16),
//         FileUploadField(
//           label: "Voter ID Front",
//           onFilePicked: (fileName, fileBytes) {
//             documentState.voterFrontFileName = fileName;
//             documentState.voterFrontBytes = fileBytes;
//             onStateChanged(documentState);
//           },
//           fileName: documentState.voterFrontFileName,
//         ),
//         SizedBox(height: 16),
//         FileUploadField(
//           label: "Voter ID Back",
//           onFilePicked: (fileName, fileBytes) {
//             documentState.voterBackFileName = fileName;
//             documentState.voterBackBytes = fileBytes;
//             onStateChanged(documentState);
//           },
//           fileName: documentState.voterBackFileName,
//         ),
//       ],
//     );
//   }
//
//   Widget _buildDivider() {
//     return Row(
//       children: [
//         Expanded(child: Divider(color: Colors.black, thickness: 1)),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//           child: Text(
//             "OR",
//             style: TextStyle(fontSize: 14),
//           ),
//         ),
//         Expanded(child: Divider(color: Colors.black, thickness: 1)),
//       ],
//     );
//   }
// }
