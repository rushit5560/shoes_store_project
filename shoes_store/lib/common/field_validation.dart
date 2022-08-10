class FieldValidator {
  String? validateFirstName(String value) {
    final validCharacters = RegExp(r'^[a-zA-Z]+$');

    if (value.isEmpty) {
      return 'First name is required';
    } else if (!validCharacters.hasMatch(value)) {
      return "Invalid first name";
    }
    return null;
  }

  String? validateUserName(String value) {
    final validCharacters = RegExp(r'^[a-zA-Z]+$');
    if (value.isEmpty) {
      return 'User name is required';
    } else if (!validCharacters.hasMatch(value)) {
      return "Invalid user name";
    }
    return null;
  }

  String? validateLastName(String value) {
    final validCharacters = RegExp(r'^[a-zA-Z]+$');

    if (value.isEmpty) {
      return 'Last name is required';
    } else if (!validCharacters.hasMatch(value)) {
      return "Invalid last name";
    }
    return null;
  }

  String? validateCompanyName(String value) {
    final validCharacters = RegExp(r'^[a-zA-Z]+$');
    if (value.isEmpty) {
      return 'Company name is required';
    } else if (!validCharacters.hasMatch(value)) {
      return "Invalid company name";
    }
    return null;
  }

  String? validateOrderNote(String value) {
    if (value.isEmpty) {
      return 'Order note is required';
    }
    return null;
  }

  String? validateAddress(String value) {
    if (value.isEmpty) {
      return 'Address is required';
    }
    return null;
  }

  String? validateCity(String value) {
    final validCharacters = RegExp(r'^[a-zA-Z]+$');
    if (value.isEmpty) {
      return 'City is required';
    } else if (!validCharacters.hasMatch(value)) {
      return "Invalid city name";
    }
    return null;
  }

  String? validateState(String value) {
    final validCharacters = RegExp(r'^[a-zA-Z]+$');
    if (value.isEmpty) {
      return 'State is required';
    } else if (!validCharacters.hasMatch(value)) {
      return "Invalid state name";
    }
    return null;
  }

  String? validateFullName(String value) {
    final validCharacters = RegExp(r'^[a-zA-Z]+$');
    if (value.isEmpty) {
      return 'Full name is required';
    } else if (!validCharacters.hasMatch(value)) {
      return "Invalid full name";
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Email is required";
    } else if (!isNumeric(value) &&
        !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
      return "Invalid email";
    } else {
      return null;
    }
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Password is required";
    } else if (value.length < 6) {
      return "Length should be 6 character";
    } else {
      return null;
    }
  }

  String? validateMobile(String value) {
    if (value.isEmpty) {
      return "Mobile number is required";
    } else if (value.length != 10) {
      return 'Mobile number must be of 10 digit';
    } else if (value.contains("-")) {
      return 'Invalid mobile number';
    } else {
      return null;
    }
  }

  bool isNumeric(String s) {
    if (s.isEmpty) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  String? validateSubject(String value) {
    if (value.isEmpty) {
      return 'Subject is required';
    } else if (!RegExp(r"^[A-Z a-z-]{2,25}$").hasMatch(value)) {
      return 'Invalid subject name';
    }
    return null;
  }

  String? validateComment(String value) {
    if (value.isEmpty) {
      return 'Comment is required';
    } else if (!RegExp(r"^[A-Z a-z-]{2,25}$").hasMatch(value)) {
      return 'Invalid comment name';
    }
    return null;
  }

  String? validateProductReview(String value) {
    if (value.isEmpty) {
      return 'Review is required';
    }
    return null;
  }

  String? validateShippingAddress(String value) {
    if (value.isEmpty) {
      return "Shipping Address should not be Empty";
    }
    return null;
  }

  String? validateBillingAddress(String value) {
    if (value.isEmpty) {
      return "Billing Address should not be Empty";
    }
    return null;
  }
}
