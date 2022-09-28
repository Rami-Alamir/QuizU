class UserData {
  bool? success;
  String? message;
  String? token;
  String? name;
  String? userStatus;
  String? mobile;

  UserData(
      {this.success,
      this.message,
      this.token,
      this.name,
      this.userStatus,
      this.mobile});

  UserData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    token = json['token'];
    name = json['name'];
    userStatus = json['user_status'];
    mobile = json['mobile'].toString();
  }
}
