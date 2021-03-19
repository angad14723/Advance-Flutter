
class MoviesModel {
  MoviesModel({
    this.year,
    this.title,
    this.info,
  });

  int year;
  String title;
  Info info;

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        year: json["year"],
        title: json["title"],
        info: Info.fromJson(json["info"]),
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "title": title,
        "info": info.toJson(),
      };
}

class Info {
  Info({
    this.directors,
    this.releaseDate,
    this.rating,
    this.genres,
    this.imageUrl,
    this.plot,
    this.rank,
    this.runningTimeSecs,
    this.actors,
  });

  List<String> directors;
  DateTime releaseDate;
  double rating;
  List<Genre> genres;
  String imageUrl;
  String plot;
  int rank;
  int runningTimeSecs;
  List<String> actors;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        directors: json["directors"] == null
            ? null
            : List<String>.from(json["directors"].map((x) => x)),
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        rating: json["rating"] == null ? null : json["rating"].toDouble(),
        genres: json["genres"] == null
            ? null
            : List<Genre>.from(json["genres"].map((x) => genreValues.map[x])),
        imageUrl: json["image_url"] == null ? null : json["image_url"],
        plot: json["plot"] == null ? null : json["plot"],
        rank: json["rank"],
        runningTimeSecs: json["running_time_secs"] == null
            ? null
            : json["running_time_secs"],
        actors: json["actors"] == null
            ? null
            : List<String>.from(json["actors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "directors": directors == null
            ? null
            : List<dynamic>.from(directors.map((x) => x)),
        "release_date":
            releaseDate == null ? null : releaseDate.toIso8601String(),
        "rating": rating == null ? null : rating,
        "genres": genres == null
            ? null
            : List<dynamic>.from(genres.map((x) => genreValues.reverse[x])),
        "image_url": imageUrl == null ? null : imageUrl,
        "plot": plot == null ? null : plot,
        "rank": rank,
        "running_time_secs": runningTimeSecs == null ? null : runningTimeSecs,
        "actors":
            actors == null ? null : List<dynamic>.from(actors.map((x) => x)),
      };
}

enum Genre {
  ACTION,
  BIOGRAPHY,
  DRAMA,
  SPORT,
  CRIME,
  THRILLER,
  ADVENTURE,
  SCI_FI,
  FANTASY,
  COMEDY,
  HORROR,
  MYSTERY,
  ROMANCE,
  ANIMATION,
  FAMILY,
  MUSIC,
  HISTORY,
  MUSICAL,
  WESTERN,
  DOCUMENTARY,
  WAR,
  FILM_NOIR,
  ADULT,
  NEWS
}

final genreValues = EnumValues({
  "Action": Genre.ACTION,
  "Adult": Genre.ADULT,
  "Adventure": Genre.ADVENTURE,
  "Animation": Genre.ANIMATION,
  "Biography": Genre.BIOGRAPHY,
  "Comedy": Genre.COMEDY,
  "Crime": Genre.CRIME,
  "Documentary": Genre.DOCUMENTARY,
  "Drama": Genre.DRAMA,
  "Family": Genre.FAMILY,
  "Fantasy": Genre.FANTASY,
  "Film-Noir": Genre.FILM_NOIR,
  "History": Genre.HISTORY,
  "Horror": Genre.HORROR,
  "Music": Genre.MUSIC,
  "Musical": Genre.MUSICAL,
  "Mystery": Genre.MYSTERY,
  "News": Genre.NEWS,
  "Romance": Genre.ROMANCE,
  "Sci-Fi": Genre.SCI_FI,
  "Sport": Genre.SPORT,
  "Thriller": Genre.THRILLER,
  "War": Genre.WAR,
  "Western": Genre.WESTERN
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
