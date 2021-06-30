class Login {
  int code;
  bool status;
  String token;
  int userID;
  String userName;
  String userEmail;

  Login(
      {this.code,
      this.status,
      this.token,
      this.userID,
      this.userName,
      this.userEmail});
  factory Login.fromJson(Map<String, dynamic> obj) {
    return Login(
      code: obj['code'],
      status: obj['status'],
      token: obj['data']['token'],
      userID: obj['data']['user']['id'],
      userName: obj['data']['user']['username'],
      userEmail: obj['data']['user']['email'],
    );
  }
}
