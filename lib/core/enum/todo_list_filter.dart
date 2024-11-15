import '../../constants/app_strings.dart';

enum TodoListFilter {
  all,
  myList
}

extension TodoListFilterTitle on TodoListFilter {
  String  get title {
    switch (this) {
      case TodoListFilter.all:
        return AppStrings.todoListFilterAll;
      case TodoListFilter.myList:
        return AppStrings.todoListFilterMyList;
      default:
        return '';
    }
  }
}