import 'dart:ffi';

class PokemonListModel {
  int? count;
  Double? next;
  Double? previous;
  List<Results>? results;

  PokemonListModel({this.count, this.next, this.previous, this.results});

  PokemonListModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }
}

class Results {
  String? name;
  String? url;

  Results({this.name, this.url});

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}
