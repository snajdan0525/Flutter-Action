
import 'package:FlutterNews/conection/api.dart';
import 'package:FlutterNews/domain/notice/notice.dart';

class NoticeRepository{

  final _api = Api("http://104.131.18.84");
  final bool _prod;

  NoticeRepository(this._prod);

  Future<List<Notice>> loadNews(String category, int page) async {

    return _prod ? _serverNews(category,page) : _localNews();

  }

  Future<List<Notice>> loadNewsRecent() async {

    return _prod ? _serverNewsRecent() : _localNewsRecent();

  }

  Future<List<Notice>> loadSearch(String query) async {

    return _prod ? _serverSearch(query) : _localSearch();

  }

  Future<List<Notice>> _serverNews(String category, int page) async{

    final Map result = await _api.get("/notice/news/$category/$page");
    return result['data']['news'].map<Notice>( (notice) => new Notice.fromMap(notice)).toList();

  }

  Future<List<Notice>> _serverNewsRecent() async{

    final Map result = await _api.get("/notice/news/recent");

    return result['data'].map<Notice>( (notice) => new Notice.fromMap(notice)).toList();

  }

  Future<List<Notice>> _serverSearch(String query) async{

    final Map result = await _api.get("/notice/search/$query");

    if(result['op']){
      return result['data'].map<Notice>( (notice) => new Notice.fromMap(notice)).toList();
    }else{
      return List();
    }

  }

  _localNews() {
    return new List();
  }

  _localNewsRecent() {
    return new List();
  }

  _localSearch() {
    return new List();
  }

}

