class User {
  String login;
  String avatarUrl;
  String name;

  User({this.login, this.avatarUrl, this.name});

  User.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    avatarUrl = json['avatarUrl'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['avatarUrl'] = this.avatarUrl;
    data['name'] = this.name;
    return data;
  }
}
