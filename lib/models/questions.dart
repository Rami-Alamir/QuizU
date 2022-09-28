class Questions {
  String? question;
  String? a;
  String? b;
  String? c;
  String? d;
  String? correct;

  Questions({this.question, this.a, this.b, this.c, this.d, this.correct});

  Questions.fromJson(Map<String, dynamic> json) {
    question = json['Question'];
    a = json['a'];
    b = json['b'];
    c = json['c'];
    d = json['d'];
    correct = json['correct'];
  }
}
