// import 'package:bpp_frontend/views/widgets/document_upload.dart';
// import 'package:flutter/material.dart';
//
// class FormValidators {
//   static bool validateDocumentUpload({
//     required BuildContext context,
//     required DocumentUploadState documentState,
//     required TextEditingController aadhaarController,
//     required TextEditingController voterIdController,
//   }) {
//     bool hasAadhaarFields = aadhaarController.text.isNotEmpty ||
//         documentState.aadhaarFrontFileName != null ||
//         documentState.aadhaarBackFileName != null;
//
//     bool hasVoterFields = voterIdController.text.isNotEmpty ||
//         documentState.voterFrontFileName != null ||
//         documentState.voterBackFileName != null;
//
//     bool isAadhaarComplete =
//         aadhaarController.text.isNotEmpty && documentState.hasCompleteAadhaar;
//
//     bool isVoterComplete =
//         voterIdController.text.isNotEmpty && documentState.hasCompleteVoter;
//
//     if (hasAadhaarFields && hasVoterFields) {
//       _showError(context,
//           "Please fill details for either Aadhaar OR Voter ID, not both.");
//       return false;
//     }
//
//     if (hasAadhaarFields && !isAadhaarComplete) {
//       _showError(context,
//           "Please complete all Aadhaar details (number, front and back images).");
//       return false;
//     }
//
//     if (hasVoterFields && !isVoterComplete) {
//       _showError(context,
//           "Please complete all Voter ID details (number, front and back images).");
//       return false;
//     }
//
//     if (!hasAadhaarFields && !hasVoterFields) {
//       _showError(
//           context, "Please complete either Aadhaar OR Voter ID details.");
//       return false;
//     }
//
//     return true;
//   }
//
//   static void _showError(BuildContext context, String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }
// }
