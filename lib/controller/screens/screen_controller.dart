import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ScreenController extends GetxController {
  late TextEditingController emailController,
      personalPhoneController,
      personalEmailController,
      passwordController,
      referralIdController;
  late FocusNode emailFocusNode,
      personalPhoneFocusNode,
      personalEmailFocusNode,
      passwordFocusNode,
      referralIdFocusNode;

  RxBool isSelected = false.obs;
  RxBool isPasswordHidden = false.obs;
  RxBool visibleReferralId = false.obs;
  RxBool isAcceptTerms = false.obs; // Terms and conditions checkbox
  RxBool isEligibleChecked = false.obs; // New checkbox for eligibility

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    personalPhoneController = TextEditingController();
    personalEmailController = TextEditingController();
    passwordController = TextEditingController();
    referralIdController = TextEditingController();

    emailFocusNode = FocusNode();
    personalPhoneFocusNode = FocusNode();
    personalEmailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    referralIdFocusNode = FocusNode();
  }

  void toggleTabs() {
    isSelected.value = !isSelected.value;
  }

  void togglePasswordHidden() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleReferralId() {
    visibleReferralId.value = !visibleReferralId.value;
  }

  // Toggle for terms and conditions checkbox
  void toggleAcceptTerms() {
    isAcceptTerms.value = !isAcceptTerms.value;
  }

  // Toggle for eligibility checkbox
  void toggleEligibleCheckbox() {
    isEligibleChecked.value = !isEligibleChecked.value;
  }
}
