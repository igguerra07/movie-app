class MovieModel {
  final int id;
  final bool video;
  final int voteCount;
  final double voteAverage;
  final String title;
  final String releaseDate;
  final String originalLanguage;
  final String originalTitle;
  final List<int> genreIds;
  final String backdropPath;
  final bool adult;
  final String overview;
  final String posterPath;
  final double popularity;
  final String mediaType;

  MovieModel(
      this.popularity,
      this.voteCount,
      this.video,
      this.posterPath,
      this.id,
      this.adult,
      this.backdropPath,
      this.originalLanguage,
      this.originalTitle,
      this.genreIds,
      this.title,
      this.voteAverage,
      this.overview,
      this.releaseDate,
      this.mediaType,);

  MovieModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        video = json['video'],
        voteCount = json['vote_count'],
        voteAverage = json['vote_average'],
        title = json['title'],
        releaseDate = json['release_date'],
        originalLanguage = json['original_language'],
        originalTitle = json['original_title'],
        genreIds = json['genre_ids'].cast<int>(),
        backdropPath = json['backdrop_path'],
        adult = json['adult'],
        overview = json['overview'],
        posterPath = json['poster_path'],
        popularity = json['popularity'],
        mediaType = json['media_type'];


  Map<String, dynamic> toJson() => {
    'popularity': popularity,
    'vote_count': voteCount,
    'video': video,
    'poster_path': posterPath,
    'id': id,
    'adult': adult,
    'backdrop_path': backdropPath,
    'original_language': originalLanguage,
    'original_title': originalTitle,
    'genre_ids': genreIds,
    'title': title,
    'vote_average': voteAverage,
    'overview': overview,
    'release_date': releaseDate,
    'media_type': mediaType,
  };
}