class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String baseUrl = "http://192.168.1.66:4000/api/";
  //static const String baseUrl = "http://192.168.4.4:3000/api/v1/";

  // ====================== Auth Routes ======================
  static const String login = "${baseUrl}user/login";
  static const String register = "${baseUrl}user/register";
  static const String updateUserProfile = "${baseUrl}user/profile";
  static const String forgotPassword = "${baseUrl}user/forgot-password"; // Added this
  static const String verifyOtp = "${baseUrl}user/verify-otp"; // Added this

  // ====================== Food Routes ======================
  static const String addFood = "${baseUrl}food/add";
  static const String listFood = "${baseUrl}food/list";
  static const String removeFood = "${baseUrl}food/remove";
  static const String searchFood = "${baseUrl}food/search";

  // ====================== Order Routes ======================
  static const String placeOrder = "${baseUrl}order/place";
  static const String verifyEsewaPayment = "${baseUrl}order/esewa/success";
  static const String esewaPaymentFail = "${baseUrl}order/esewa/fail";
  static const String verifyOrder = "${baseUrl}order/verify";
  static const String userOrders = "${baseUrl}order/userorders";
  static const String listOrders = "${baseUrl}order/list";
  static const String updateStatus = "${baseUrl}order/status";
}
