class MovieItem {
  int _page;
  List<Results> _results;
  int _totalResults;
  int _totalPages;

  MovieItem(
      {int page, List<Results> results, int totalResults, int totalPages}) {
    this._page = page;
    this._results = results;
    this._totalResults = totalResults;
    this._totalPages = totalPages;
  }

  int get page => _page;
  set page(int page) => _page = page;
  List<Results> get results => _results;
  set results(List<Results> results) => _results = results;
  int get totalResults => _totalResults;
  set totalResults(int totalResults) => _totalResults = totalResults;
  int get totalPages => _totalPages;
  set totalPages(int totalPages) => _totalPages = totalPages;

  MovieItem.fromJson(Map<String, dynamic> json) {
    _page = json['page'];
    if (json['results'] != null) {
      _results = new List<Results>();
      json['results'].forEach((v) {
        _results.add(new Results.fromJson(v));
      });
    }
    _totalResults = json['total_results'];
    _totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this._page;
    if (this._results != null) {
      data['results'] = this._results.map((v) => v.toJson()).toList();
    }
    data['total_results'] = this._totalResults;
    data['total_pages'] = this._totalPages;
    return data;
  }
}

class Results {
  String _posterPath;
  bool _adult;
  String _overview;
  String _releaseDate;
  List<int> _genreIds;
  int _id;
  String _originalTitle;
  String _originalLanguage;
  String _title;
  String _backdropPath;
  double _popularity;
  int _voteCount;
  bool _video;
  double _voteAverage;

  Results(
      {String posterPath,
        bool adult,
        String overview,
        String releaseDate,
        List<int> genreIds,
        int id,
        String originalTitle,
        String originalLanguage,
        String title,
        String backdropPath,
        double popularity,
        int voteCount,
        bool video,
        double voteAverage}) {
    this._posterPath = posterPath;
    this._adult = adult;
    this._overview = overview;
    this._releaseDate = releaseDate;
    this._genreIds = genreIds;
    this._id = id;
    this._originalTitle = originalTitle;
    this._originalLanguage = originalLanguage;
    this._title = title;
    this._backdropPath = backdropPath;
    this._popularity = popularity;
    this._voteCount = voteCount;
    this._video = video;
    this._voteAverage = voteAverage;
  }

  String get posterPath => _posterPath;
  set posterPath(String posterPath) => _posterPath = posterPath;
  bool get adult => _adult;
  set adult(bool adult) => _adult = adult;
  String get overview => _overview;
  set overview(String overview) => _overview = overview;
  String get releaseDate => _releaseDate;
  set releaseDate(String releaseDate) => _releaseDate = releaseDate;
  List<int> get genreIds => _genreIds;
  set genreIds(List<int> genreIds) => _genreIds = genreIds;
  int get id => _id;
  set id(int id) => _id = id;
  String get originalTitle => _originalTitle;
  set originalTitle(String originalTitle) => _originalTitle = originalTitle;
  String get originalLanguage => _originalLanguage;
  set originalLanguage(String originalLanguage) =>
      _originalLanguage = originalLanguage;
  String get title => _title;
  set title(String title) => _title = title;
  String get backdropPath => _backdropPath;
  set backdropPath(String backdropPath) => _backdropPath = backdropPath;
  double get popularity => _popularity;
  set popularity(double popularity) => _popularity = popularity;
  int get voteCount => _voteCount;
  set voteCount(int voteCount) => _voteCount = voteCount;
  bool get video => _video;
  set video(bool video) => _video = video;
  double get voteAverage => _voteAverage;
  set voteAverage(double voteAverage) => _voteAverage = voteAverage;

  Results.fromJson(Map<String, dynamic> json) {
    _posterPath = json['poster_path'];
    _adult = json['adult'];
    _overview = json['overview'];
    _releaseDate = json['release_date'];
    _genreIds = json['genre_ids'].cast<int>();
    _id = json['id'];
    _originalTitle = json['original_title'];
    _originalLanguage = json['original_language'];
    _title = json['title'];
    _backdropPath = json['backdrop_path'];
    _popularity = json['popularity'];
    _voteCount = json['vote_count'];
    _video = json['video'];
    _voteAverage = json['vote_average'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['poster_path'] = this._posterPath;
    data['adult'] = this._adult;
    data['overview'] = this._overview;
    data['release_date'] = this._releaseDate;
    data['genre_ids'] = this._genreIds;
    data['id'] = this._id;
    data['original_title'] = this._originalTitle;
    data['original_language'] = this._originalLanguage;
    data['title'] = this._title;
    data['backdrop_path'] = this._backdropPath;
    data['popularity'] = this._popularity;
    data['vote_count'] = this._voteCount;
    data['video'] = this._video;
    data['vote_average'] = this._voteAverage;
    return data;
  }
}