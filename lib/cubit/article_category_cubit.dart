import 'package:bloc/bloc.dart';

class ArticleCategoryCubit extends Cubit<int> {
  // start from review buku category
  ArticleCategoryCubit() : super(78);

  void categorySelection(int categoryId) {
    emit(categoryId);
  }
}
