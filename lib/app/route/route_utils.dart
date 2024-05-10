enum PAGES {
  signin,
  register,
  forgotpassword,
  home,
  error,
}

extension AppPageExtension on PAGES {
  String get screenPath {
    switch (this) {
      case PAGES.home:
        return "/";
      case PAGES.signin:
        return "/signin";
      case PAGES.register:
        return "/register";
      case PAGES.forgotpassword:
        return "/recover";
      case PAGES.error:
        return "/error";

      default:
        return "/";
    }
  }

  String get screenName {
    switch (this) {
      case PAGES.home:
        return "HOME";
      case PAGES.signin:
        return "SIGNIN";
      case PAGES.error:
        return "ERROR";
      case PAGES.register:
        return "REGISTER";
      case PAGES.forgotpassword:
        return "FORGOTPASSWORD";
      default:
        return "HOME";
    }
  }
}
