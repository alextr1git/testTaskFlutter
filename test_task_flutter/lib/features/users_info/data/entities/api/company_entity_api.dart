class CompanyEntityApi {
  String name;
  String catchPhrase;
  String bs;

  CompanyEntityApi({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory CompanyEntityApi.fromJson(Map<String, dynamic> json) => CompanyEntityApi(
        name: json["name"] ?? "",
        catchPhrase: json["catchPhrase"] ?? "",
        bs: json["bs"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };
}
