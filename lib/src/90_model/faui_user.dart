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

  String get fname => _fname;
  String get lname => _lname;
  String get serialNum => _serialNum;

  set fname(String value) {
    _fname = value;
  }

  set lname(String value) {
    _lname = value;
  }

  set serialNum(String value) {
    _serialNum = value;
  }

  FauiUser({
    this.email,
    this.userId,
    this.token,
    this.refreshToken,
    this.displayName,
  });

  FauiUser.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        userId = json['userId'],
        token = json['token'],
        refreshToken = json['refreshToken'],
        displayName = json['displayName'],
        _fname = json['fname'],
        _lname = json['lname'],
        _serialNum = json['serialNum'];

  Map<String, dynamic> toJson() =>
      {
        'email': email,
        'userId': userId,
        'token': token,
        'refreshToken': refreshToken,
        'displayName': displayName,
        'fname': _fname,
        'lname': _lname,
        'serialNum': _serialNum,
      };


}
