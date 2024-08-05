class AppLinks{

  static const String server = "https://test.kafiil.com";

  /* =============================== Auth =============================== */

  static const String register = "$server/api/test/user/register";
  static const String login = "$server/api/test/user/login";

  /* =============================== ForgotPassword =============================== */

  static const String resetpass             = "$server/forgotpass/resetpass.php";
  static const String checkemail            = "$server/forgotpass/checkemail.php";
  static const String verifycodeforgotpass  = "$server/forgotpass/verifycode.php";

}