/// The class represents a registered user.
class FauiUser {
  final String email;
  final String userId;
  final String token;
  final String refreshToken;
  final String displayName;
  String _fname;
  String _lname;
  String _serialNum;
  String _contactEmail;
  String _verified;

  String get fname => _fname;
  String get lname => _lname;
  String get serialNum => _serialNum;
  String get contactEmail => _contactEmail;
  dynamic get verified => getBool(_verified);

  bool getBool(String value) {
    return (_verified != null) ? _verified.toLowerCase() == 'true' : false;
  }

  set fname(String value) {
    _fname = value;
  }

  set lname(String value) {
    _lname = value;
  }

  set serialNum(String value) {
    _serialNum = value;
  }

  set contactEmail(String value) {
    _contactEmail = value;
  }

  set verified(String value) {
    _verified = value;
  }

  FauiUser({this.email, this.userId, this.token, this.refreshToken, this.displayName});

  FauiUser.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        userId = json['userId'],
        token = json['token'],
        refreshToken = json['refreshToken'],
        displayName = json['displayName'],
        _fname = json['fname'],
        _lname = json['lname'],
        _serialNum = json['serialNum'],
        _contactEmail = json['contactEmail'],
        _verified = json['verified'];

  Map<String, dynamic> toJson() => {
        'email': email,
        'userId': userId,
        'token': token,
        'refreshToken': refreshToken,
        'displayName': displayName,
        'fname': _fname,
        'lname': _lname,
        'serialNum': _serialNum,
        'contactEmail': _contactEmail,
        'verified': _verified,
      };
}
