class Launch {
  final int flightNumber;
  final String name;
  final bool upcoming;
  final DateTime launchDateLocal;
  final int? launchDateUnix;
  final String? launchDateUTC;
  final bool? success;
  final String? patchImageSmall;
  final String? patchImageLarge;
  final String? details;
  final String? youtubeId;
  final String? launchpadId;

  Launch({
    required this.flightNumber,
    required this.name,
    required this.upcoming,
    required this.launchDateLocal,
    this.launchDateUnix,
    this.launchDateUTC,
    this.success,
    this.patchImageSmall,
    this.patchImageLarge,
    this.details,
    this.youtubeId,
    this.launchpadId,
  });
}
