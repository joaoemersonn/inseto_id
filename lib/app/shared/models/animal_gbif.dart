class AnimalGBIF {
  int key;
  int nubKey;
  int nameKey;
  String taxonID;
  int sourceTaxonKey;
  String kingdom;
  String phylum;
  String order;
  String family;
  String genus;
  String species;
  int kingdomKey;
  int phylumKey;
  int classKey;
  int orderKey;
  int familyKey;
  int genusKey;
  int speciesKey;
  String datasetKey;
  String constituentKey;
  int parentKey;
  String parent;
  int basionymKey;
  String basionym;
  String scientificName;
  String canonicalName;
  String vernacularName;
  String authorship;
  String nameType;
  String rank;
  String origin;
  String taxonomicStatus;
  String remarks;
  String publishedIn;
  int numDescendants;
  String lastCrawled;
  String lastInterpreted;
  bool synonym;
  String classe;

  AnimalGBIF(
      {this.key,
      this.nubKey,
      this.nameKey,
      this.taxonID,
      this.sourceTaxonKey,
      this.kingdom,
      this.phylum,
      this.order,
      this.family,
      this.genus,
      this.species,
      this.kingdomKey,
      this.phylumKey,
      this.classKey,
      this.orderKey,
      this.familyKey,
      this.genusKey,
      this.speciesKey,
      this.datasetKey,
      this.constituentKey,
      this.parentKey,
      this.parent,
      this.basionymKey,
      this.basionym,
      this.scientificName,
      this.canonicalName,
      this.vernacularName,
      this.authorship,
      this.nameType,
      this.rank,
      this.origin,
      this.taxonomicStatus,
      this.remarks,
      this.publishedIn,
      this.numDescendants,
      this.lastCrawled,
      this.lastInterpreted,
      this.synonym,
      this.classe});

  AnimalGBIF.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    nubKey = json['nubKey'];
    nameKey = json['nameKey'];
    taxonID = json['taxonID'];
    sourceTaxonKey = json['sourceTaxonKey'];
    kingdom = json['kingdom'];
    phylum = json['phylum'];
    order = json['order'];
    family = json['family'];
    genus = json['genus'];
    species = json['species'];
    kingdomKey = json['kingdomKey'];
    phylumKey = json['phylumKey'];
    classKey = json['classKey'];
    orderKey = json['orderKey'];
    familyKey = json['familyKey'];
    genusKey = json['genusKey'];
    speciesKey = json['speciesKey'];
    datasetKey = json['datasetKey'];
    constituentKey = json['constituentKey'];
    parentKey = json['parentKey'];
    parent = json['parent'];
    basionymKey = json['basionymKey'];
    basionym = json['basionym'];
    scientificName = json['scientificName'];
    canonicalName = json['canonicalName'];
    vernacularName = json['vernacularName'];
    authorship = json['authorship'];
    nameType = json['nameType'];
    rank = json['rank'];
    origin = json['origin'];
    taxonomicStatus = json['taxonomicStatus'];
    remarks = json['remarks'];
    publishedIn = json['publishedIn'];
    numDescendants = json['numDescendants'];
    lastCrawled = json['lastCrawled'];
    lastInterpreted = json['lastInterpreted'];
    synonym = json['synonym'];
    classe = json['class'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['nubKey'] = this.nubKey;
    data['nameKey'] = this.nameKey;
    data['taxonID'] = this.taxonID;
    data['sourceTaxonKey'] = this.sourceTaxonKey;
    data['kingdom'] = this.kingdom;
    data['phylum'] = this.phylum;
    data['order'] = this.order;
    data['family'] = this.family;
    data['genus'] = this.genus;
    data['species'] = this.species;
    data['kingdomKey'] = this.kingdomKey;
    data['phylumKey'] = this.phylumKey;
    data['classKey'] = this.classKey;
    data['orderKey'] = this.orderKey;
    data['familyKey'] = this.familyKey;
    data['genusKey'] = this.genusKey;
    data['speciesKey'] = this.speciesKey;
    data['datasetKey'] = this.datasetKey;
    data['constituentKey'] = this.constituentKey;
    data['parentKey'] = this.parentKey;
    data['parent'] = this.parent;
    data['basionymKey'] = this.basionymKey;
    data['basionym'] = this.basionym;
    data['scientificName'] = this.scientificName;
    data['canonicalName'] = this.canonicalName;
    data['vernacularName'] = this.vernacularName;
    data['authorship'] = this.authorship;
    data['nameType'] = this.nameType;
    data['rank'] = this.rank;
    data['origin'] = this.origin;
    data['taxonomicStatus'] = this.taxonomicStatus;
    data['remarks'] = this.remarks;
    data['publishedIn'] = this.publishedIn;
    data['numDescendants'] = this.numDescendants;
    data['lastCrawled'] = this.lastCrawled;
    data['lastInterpreted'] = this.lastInterpreted;
    data['synonym'] = this.synonym;
    data['class'] = this.classe;
    return data;
  }
}
