class LocationInformation {
  LocationInformation({this.locationType, this.address});

  String? locationType;
  String? address;

  factory LocationInformation.fromJson(Map<String, dynamic> json) =>
      LocationInformation(
        locationType: json[''],
        address: json[''],
      );
}
