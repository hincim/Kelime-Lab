class TimeDefinition {
  String text;
  String pos;
  String ts;
  List<Translation> tr;
  int nmtCode;
  int code;

  TimeDefinition({
    required this.text,
    required this.pos,
    required this.ts,
    required this.tr,
    required this.nmtCode,
    required this.code,
  });

  factory TimeDefinition.fromJson(Map<String, dynamic> json) {
    return TimeDefinition(
      text: json['text'] ?? '',
      pos: json['pos'] ?? '',
      ts: json['ts'] ?? '',
      tr: List<Translation>.from(
        json['tr'].map((x) => Translation.fromJson(x)),
      ),
      nmtCode: json['nmt_code'] ?? 0,
      code: json['code'] ?? 0,
    );
  }
}

class Translation {
  String text;
  String pos;
  int fr;
  List<Synonym> syn;
  List<String> mean;

  Translation({
    required this.text,
    required this.pos,
    required this.fr,
    required this.syn,
    required this.mean,
  });

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      text: json['text'] ?? '',
      pos: json['pos'] ?? '',
      fr: json['fr'] ?? 0,
      syn: List<Synonym>.from(
        json['syn'].map((x) => Synonym.fromJson(x)),
      ),
      mean: List<String>.from(json['mean']),
    );
  }
}

class Synonym {
  String text;
  String pos;
  int fr;

  Synonym({
    required this.text,
    required this.pos,
    required this.fr,
  });

  factory Synonym.fromJson(Map<String, dynamic> json) {
    return Synonym(
      text: json['text'] ?? '',
      pos: json['pos'] ?? '',
      fr: json['fr'] ?? 0,
    );
  }
}