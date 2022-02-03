import 'package:bloc/bloc.dart';
import 'package:dart_rss/dart_rss.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'news_state.dart';

const String _top7URL = 'https://lenta.ru/rss/top7';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  Future<void> loadNews() async {
    try {
      final response = await http.Client().get(Uri.parse(_top7URL));
      final rssFeed = RssFeed.parse(response.body);
      emit(NewsLoadedState(rssFeed.items));
    } catch (e) {
      emit(NewsErrorState('o_O'));
    }
  }

  Future<void> reloadNews() async {
    emit(NewsInitial());
  }
}
