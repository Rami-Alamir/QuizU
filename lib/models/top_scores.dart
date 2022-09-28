class TopScores {
  String? name;
  int? score;

  TopScores({this.name, this.score});

  TopScores.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    score = json['score'];
  }
}
