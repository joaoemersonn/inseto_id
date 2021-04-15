class WikiResult {
  bool _batchcomplete;
  Warnings _warnings;
  Query _query;

  WikiResult({bool batchcomplete, Warnings warnings, Query query}) {
    this._batchcomplete = batchcomplete;
    this._warnings = warnings;
    this._query = query;
  }

  bool get batchcomplete => _batchcomplete;
  set batchcomplete(bool batchcomplete) => _batchcomplete = batchcomplete;
  Warnings get warnings => _warnings;
  set warnings(Warnings warnings) => _warnings = warnings;
  Query get query => _query;
  set query(Query query) => _query = query;

  WikiResult.fromJson(Map<String, dynamic> json) {
    _batchcomplete = json['batchcomplete'];
    _warnings = json['warnings'] != null
        ? new Warnings.fromJson(json['warnings'])
        : null;
    _query = json['query'] != null ? new Query.fromJson(json['query']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['batchcomplete'] = this._batchcomplete;
    if (this._warnings != null) {
      data['warnings'] = this._warnings.toJson();
    }
    if (this._query != null) {
      data['query'] = this._query.toJson();
    }
    return data;
  }
}

class Warnings {
  Extracts _extracts;

  Warnings({Extracts extracts}) {
    this._extracts = extracts;
  }

  Extracts get extracts => _extracts;
  set extracts(Extracts extracts) => _extracts = extracts;

  Warnings.fromJson(Map<String, dynamic> json) {
    _extracts = json['extracts'] != null
        ? new Extracts.fromJson(json['extracts'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._extracts != null) {
      data['extracts'] = this._extracts.toJson();
    }
    return data;
  }
}

class Extracts {
  String _warnings;

  Extracts({String warnings}) {
    this._warnings = warnings;
  }

  String get warnings => _warnings;
  set warnings(String warnings) => _warnings = warnings;

  Extracts.fromJson(Map<String, dynamic> json) {
    _warnings = json['warnings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['warnings'] = this._warnings;
    return data;
  }
}

class Query {
  List<Normalized> _normalized;
  List<Pages> _pages;

  Query({List<Normalized> normalized, List<Pages> pages}) {
    this._normalized = normalized;
    this._pages = pages;
  }

  List<Normalized> get normalized => _normalized;
  set normalized(List<Normalized> normalized) => _normalized = normalized;
  List<Pages> get pages => _pages;
  set pages(List<Pages> pages) => _pages = pages;

  Query.fromJson(Map<String, dynamic> json) {
    if (json['normalized'] != null) {
      _normalized = new List<Normalized>();
      json['normalized'].forEach((v) {
        _normalized.add(new Normalized.fromJson(v));
      });
    }
    if (json['pages'] != null) {
      _pages = new List<Pages>();
      json['pages'].forEach((v) {
        _pages.add(new Pages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._normalized != null) {
      data['normalized'] = this._normalized.map((v) => v.toJson()).toList();
    }
    if (this._pages != null) {
      data['pages'] = this._pages.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Normalized {
  bool _fromencoded;
  String _from;
  String _to;

  Normalized({bool fromencoded, String from, String to}) {
    this._fromencoded = fromencoded;
    this._from = from;
    this._to = to;
  }

  bool get fromencoded => _fromencoded;
  set fromencoded(bool fromencoded) => _fromencoded = fromencoded;
  String get from => _from;
  set from(String from) => _from = from;
  String get to => _to;
  set to(String to) => _to = to;

  Normalized.fromJson(Map<String, dynamic> json) {
    _fromencoded = json['fromencoded'];
    _from = json['from'];
    _to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fromencoded'] = this._fromencoded;
    data['from'] = this._from;
    data['to'] = this._to;
    return data;
  }
}

class Pages {
  int _pageid;
  int _ns;
  String _title;
  String _extract;

  Pages({int pageid, int ns, String title, String extract}) {
    this._pageid = pageid;
    this._ns = ns;
    this._title = title;
    this._extract = extract;
  }

  int get pageid => _pageid;
  set pageid(int pageid) => _pageid = pageid;
  int get ns => _ns;
  set ns(int ns) => _ns = ns;
  String get title => _title;
  set title(String title) => _title = title;
  String get extract => _extract;
  set extract(String extract) => _extract = extract;

  Pages.fromJson(Map<String, dynamic> json) {
    _pageid = json['pageid'];
    _ns = json['ns'];
    _title = json['title'];
    _extract = json['extract'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageid'] = this._pageid;
    data['ns'] = this._ns;
    data['title'] = this._title;
    data['extract'] = this._extract;
    return data;
  }
}
