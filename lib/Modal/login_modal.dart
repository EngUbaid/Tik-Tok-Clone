class LoginModal {
  LoginModal({
    required this.message,
    required this.errors,
  });

  late final String message;
  late final Errors errors;

  LoginModal.fromJson(Map<String, dynamic> json) {
    message = json['message'] ?? ''; // Handle null message
    errors = Errors.fromJson(json['errors'] ?? {});
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['errors'] = errors.toJson();
    return _data;
  }
}

class Errors {
  Errors({
    required this.email,
    required this.password,
  });

  late final List<String> email;
  late final List<String> password;

  Errors.fromJson(Map<String, dynamic> json) {
    email = List<String>.from(json['email'] ?? []); // Handle null email
    password =
        List<String>.from(json['password'] ?? []); // Handle null password
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['password'] = password;
    return _data;
  }
}
