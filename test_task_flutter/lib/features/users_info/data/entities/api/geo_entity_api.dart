class GeoEntityApi {
  String lat;
  String lng;

  GeoEntityApi({
    required this.lat,
    required this.lng,
  });

  factory GeoEntityApi.fromJson(Map<String, dynamic> json) => GeoEntityApi(
        lat: json["lat"] ?? "",
        lng: json["lng"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}
