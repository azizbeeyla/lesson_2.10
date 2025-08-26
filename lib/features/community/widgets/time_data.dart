String formatTimeAgo(String created) {
  final createdDate = DateTime.parse(created);
  final now = DateTime.now();
  final difference = now.difference(createdDate);

  if (difference.inDays >= 365) {
    final years = (difference.inDays ~/ 365).floor();
    return "$years yil oldin";
  } else if (difference.inDays >= 30) {
    final months = (difference.inDays ~/ 30).floor();
    return "$months oy oldin";
  } else if (difference.inDays > 0) {
    return "${difference.inDays} kun oldin";
  } else {
    return "Bugun";
  }
}
