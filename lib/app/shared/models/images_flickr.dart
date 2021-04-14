class ImagensFlickr {
  String _title;
  String _link;
  String _description;
  String _modified;
  String _generator;
  List<Items> _items;

  ImagensFlickr(
      {String title,
      String link,
      String description,
      String modified,
      String generator,
      List<Items> items}) {
    this._title = title;
    this._link = link;
    this._description = description;
    this._modified = modified;
    this._generator = generator;
    this._items = items;
  }

  String get title => _title;
  set title(String title) => _title = title;
  String get link => _link;
  set link(String link) => _link = link;
  String get description => _description;
  set description(String description) => _description = description;
  String get modified => _modified;
  set modified(String modified) => _modified = modified;
  String get generator => _generator;
  set generator(String generator) => _generator = generator;
  List<Items> get items => _items;
  set items(List<Items> items) => _items = items;

  ImagensFlickr.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _link = json['link'];
    _description = json['description'];
    _modified = json['modified'];
    _generator = json['generator'];
    if (json['items'] != null) {
      _items = new List<Items>();
      json['items'].forEach((v) {
        _items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this._title;
    data['link'] = this._link;
    data['description'] = this._description;
    data['modified'] = this._modified;
    data['generator'] = this._generator;
    if (this._items != null) {
      data['items'] = this._items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String _title;
  String _link;
  Media _media;
  String _dateTaken;
  String _description;
  String _published;
  String _author;
  String _authorId;
  String _tags;

  Items(
      {String title,
      String link,
      Media media,
      String dateTaken,
      String description,
      String published,
      String author,
      String authorId,
      String tags}) {
    this._title = title;
    this._link = link;
    this._media = media;
    this._dateTaken = dateTaken;
    this._description = description;
    this._published = published;
    this._author = author;
    this._authorId = authorId;
    this._tags = tags;
  }

  String get title => _title;
  set title(String title) => _title = title;
  String get link => _link;
  set link(String link) => _link = link;
  Media get media => _media;
  set media(Media media) => _media = media;
  String get dateTaken => _dateTaken;
  set dateTaken(String dateTaken) => _dateTaken = dateTaken;
  String get description => _description;
  set description(String description) => _description = description;
  String get published => _published;
  set published(String published) => _published = published;
  String get author => _author;
  set author(String author) => _author = author;
  String get authorId => _authorId;
  set authorId(String authorId) => _authorId = authorId;
  String get tags => _tags;
  set tags(String tags) => _tags = tags;

  Items.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _link = json['link'];
    _media = json['media'] != null ? new Media.fromJson(json['media']) : null;
    _dateTaken = json['date_taken'];
    _description = json['description'];
    _published = json['published'];
    _author = json['author'];
    _authorId = json['author_id'];
    _tags = json['tags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this._title;
    data['link'] = this._link;
    if (this._media != null) {
      data['media'] = this._media.toJson();
    }
    data['date_taken'] = this._dateTaken;
    data['description'] = this._description;
    data['published'] = this._published;
    data['author'] = this._author;
    data['author_id'] = this._authorId;
    data['tags'] = this._tags;
    return data;
  }
}

class Media {
  String _m;

  Media({String m}) {
    this._m = m;
  }

  String get m => _m;
  set m(String m) => _m = m;

  Media.fromJson(Map<String, dynamic> json) {
    _m = json['m'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['m'] = this._m;
    return data;
  }
}
