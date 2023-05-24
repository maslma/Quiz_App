import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/cubit/question_state.dart';
import 'package:quiz/domain/question_model.dart';
import 'package:quiz/presentaion/presentation_managers/colors.dart';
import 'package:sqflite/sqflite.dart';

class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit() : super(CreateQuizInitial());

  static QuestionCubit get(context) => BlocProvider.of(context);
  Database? database;
  List<QuestionModel>? questions = [];
  List<int?> answersIndex = [];
  bool showResult = false;
  List<QuestionModel>? questionsModel;
  final PageController pageController = PageController();

  List<String> items = ['A', 'B', 'C', 'D'];
  String? selectedItem;

 final questionController = TextEditingController();
 final firstController = TextEditingController();
 final secondController = TextEditingController();
 final thirdController = TextEditingController();
 final fourthController = TextEditingController();

 final GlobalKey<FormState> formKey=GlobalKey<FormState>();


  int chatToInt(String char) {
    switch (char) {
      case "A":
        {
          return 0;
        }
      case "B":
        {
          return 1;
        }
      case "C":
        {
          return 2;
        }
      case "D":
        {
          return 3;
        }
    }
    return 0;
  }
  void reset(){
    questionController.clear();
    firstController.clear();
    secondController.clear();
    thirdController.clear();
    fourthController.clear();
    selectedItem = items[0];
  }

  void setShowResult(bool value) {
    showResult = value;
    emit(SetShowState());
  }

  double calculateGrade() {
    if (questions == null || questions!.isEmpty || answersIndex.isEmpty) {
      return 0.0;
    }

    int totalQuestions = questions?.length ?? 0;
    int totalCorrect = 0;

    for (int i = 0; i < totalQuestions; i++) {
      QuestionModel question = questions![i];
      int? userAnswer = answersIndex[i];
      if (userAnswer != null && userAnswer == question.correctIndex) {
        totalCorrect++;
      }
    }

    return (totalCorrect / totalQuestions) * 100.0;
  }

  void setAnswer(int index, int value) {
    answersIndex[index] = value;
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );    emit(SetAnswerState());
  }

  Future<void> createDatabase() async {
    await openDatabase(
        //المتغير داتابيز ينشأ بقيمة فارغة وتظرا لأنه قبل الأويت فأنه ينشأ قبل أي متغير بعده
        'quiz.db',
        version: 1, onCreate: (database, version) {
      print('Database Created');
      database
          .execute(
              'CREATE TABLE questions ( id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, first TEXT, second TEXT, third TEXT, fourth TEXT, correct INTEGER )')
          .then((value) {
        print('Table Created');
      }).catchError((onError) {
        print('Error in creation${onError.toString()}');
      });
    }, onOpen: (database) {
      this.database = database;
      getDataFromDatabase();
    });
  }

  Future<void> insertToDataBase(
      {required String title,
      required String first,
      required String second,
      required String third,
      required String fourth,
      required int correct,
      context}) async {
    await database!.transaction((txn) async {
      await txn
          .rawInsert(
              'INSERT INTO questions(title, first, second, third,fourth,correct) VALUES("$title","$first","$second","$third","$fourth","$correct")')
          .catchError((onError) {
        print('Error in inserting New Record ${onError.toString()}');
      });
      getDataFromDatabase();
    });
  }

  deleteFromDatabase(int id) async {
    await database?.rawDelete('DELETE FROM questions WHERE id=$id');
    getDataFromDatabase();
  }

  Future<void> getDataFromDatabase() async {
    List<Map<String, dynamic>> temp =
        await database!.rawQuery('SELECT * FROM questions');
    questions = temp.map((e) => QuestionModel.fromMap(e)).toList();
    emit(GetDataState());
  }

  showAlertDialog(BuildContext context, int id) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Delete question"),
      content: const Text("Are you sure you want to delete this question?"),
      actions: [
        TextButton(
          child: const Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text("Delete"),
          onPressed: () {
            deleteFromDatabase(id);
            showSnackBar(context, message: 'Question deleted successfully');
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void showSnackBar(BuildContext context,
      {required String message, bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: AppColor.background),
        ),
        backgroundColor: error ? Colors.red : Colors.black,
        duration: const Duration(seconds: 2),
        dismissDirection: DismissDirection.horizontal,
      ),
    );
  }
}
