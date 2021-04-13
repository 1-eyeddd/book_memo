import 'package:flutter/material.dart';
import 'package:flutter_portfolio/models/dao/books/book_dao.dart';
import 'package:flutter_portfolio/models/service/user_service.dart';

enum AddBookTextFieldValidateType {
  imageUrl,
  title,
}

class AddBookViewModel extends ChangeNotifier {
  //タップして本が追加される
  void onPressdAddBook({
    @required BuildContext context,
    @required String title,
    @required String imageUrl,
  }) {
    final user = UserService.getUserInfo().uid;
    BookDao.addBook(
      userId: user,
      title: title,
      imageUrl: imageUrl,
    );
    Navigator.of(context).pop();
  }

  // テキストフィールドのvalidatorテキスト
  String createValidatorText({
    @required String inputText,
    @required AddBookTextFieldValidateType type,
  }) {
    if (inputText.isEmpty) {
      switch (type) {
        case AddBookTextFieldValidateType.title:
          return '本の名前を入力してください';
        case AddBookTextFieldValidateType.imageUrl:
          return '本の写真のURLを入力してください';
      }
    }
    return null;
  }
}
