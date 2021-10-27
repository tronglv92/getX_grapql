class ThumbNail{
  final String url;
  ThumbNail({required this.url});
  factory ThumbNail.fromJson(Map<String, dynamic> json) =>
      ThumbNail(
          url: json["url"],

      );

  Map<String, dynamic> toJson() => {
    "url": url,

  };
}