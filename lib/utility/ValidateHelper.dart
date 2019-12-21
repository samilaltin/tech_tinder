class ValidateHelper {
  static final String EMAIL_REGEXP =
      r"[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";

  static final String NAME_REGEXP = r"((([a-zA-Z])+(\s))+([a-zA-Z])+)";

  static final String USERNAME_REGEXP = r"^[a-zA-Z0-9_.]+$";

  static final String PASSWORD_REGEXP = r"[a-zA-Z0-9/._-]{6,16}$";

  static final String DATE_REGEXP =
      r"^([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)\d{4}$";

  static final String JUST_NUMBER_REGEXP = r"^([0-9])+$";

  static String eMail(String value) {
    value = value.trim();
    if (value.isEmpty) {
      return 'Bu alan boş olamaz.';
    } else if (!new RegExp(EMAIL_REGEXP).hasMatch(value)) {
      return 'Geçerli bir e-posta (abc@gamerhub.com) giriniz.';
    }
    return null;
  }

  static String justNumber(String value) {
    value = value.trim();
    if (value.isEmpty) {
      return 'Bu alan boş olamaz.';
    } else if (!new RegExp(JUST_NUMBER_REGEXP).hasMatch(value)) {
      return 'Sadece sayı giriniz.';
    }
    return null;
  }

  static String name(String value) {
    value = value.trim();
    if (value.isEmpty) {
      return 'Bu alan boş olamaz.';
    } else if (!new RegExp(NAME_REGEXP).hasMatch(value)) {
      return 'Geçerli bir ad soyad (ABC ABC) giriniz.';
    }
    return null;
  }

  static String userName(String value) {
    value = value.trim();
    if (value.isEmpty) {
      return 'Bu alan boş olamaz.';
    } else if (!new RegExp(USERNAME_REGEXP).hasMatch(value)) {
      return 'Geçerli bir kullacı adı (XXX) giriniz.';
    }
    return null;
  }

  static String contacts(String value) {
    value = value.trim();
    if (value.isEmpty) {
      return null;
    } else if (!new RegExp(USERNAME_REGEXP).hasMatch(value)) {
      return 'Geçerli bir link (XXX) giriniz.';
    }
    return null;
  }

  static String password(String value) {
    if (value.isEmpty) {
      return 'Bu alan boş olamaz.';
    } else if (!new RegExp(PASSWORD_REGEXP).hasMatch(value)) {
      return 'Geçerli bir şifre giriniz.';
    }
    return null;
  }

  static String date(String value) {
    if (value.isEmpty) {
      return 'Bu alan boş olamaz.';
    } else if (!new RegExp(PASSWORD_REGEXP).hasMatch(value)) {
      return 'Geçerli bir tarih(gg/aa/yyyy) giriniz.';
    }
    return null;
  }
}
