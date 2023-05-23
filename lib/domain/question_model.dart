class QuestionModel {
  final int id;
  final String title;
  final List<String> answers;
  final int correctIndex;

  QuestionModel({
    required this.id,
    required this.title,
    required this.answers,
    required this.correctIndex,
  });

  static QuestionModel fromMap(Map<String, dynamic> query) {
    return QuestionModel(
      id: query['id'],
      title: query['title'],
      answers: [query['first'],query['second'],query['third'],query['fourth']],
      correctIndex: query['correct'],
    );
  }
}
