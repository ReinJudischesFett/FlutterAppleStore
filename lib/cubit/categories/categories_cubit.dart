import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  void selectCategory(String category) {
    emit(CategoriesSelected(category));
  }

  void removeCategory() {
    emit(CategoriesInitial());
  }
}
