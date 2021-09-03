class DataModel {
  final int trackId;
  final String trackName;
  final String albumName;
  final String artistName;
  final int rating;
  final int explicit;
  final String trackShareUrl;
  DataModel({
    required this.trackId,
    required this.trackName,
    required this.albumName,
    required this.artistName,
    required this.rating,
    required this.explicit,
    required this.trackShareUrl,
  });
}
