import '../../constants/app_strings.dart';

// TodoListFilter to use it in the todo list screen filter
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