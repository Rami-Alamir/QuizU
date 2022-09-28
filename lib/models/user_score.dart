class UserScore {
  int? score;
  String? date;

  UserScore({this.score, this.date});

  UserScore.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['score'] = score;
    data['date'] = date;
    return data;
  }
}
