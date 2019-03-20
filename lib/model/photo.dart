class Photo {
  Photo({
    this.photoUrl,
    this.title,
    this.caption,
    this.isFavorite = false,
  });

  final String photoUrl;
  final String title;
  final String caption;

  bool isFavorite;
  String get tag => photoUrl; // Assuming that all asset names are unique.

  bool get isValid => photoUrl != null && title != null && caption != null && isFavorite != null;
}