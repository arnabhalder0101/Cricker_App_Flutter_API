class MatchInfo {
  String match_date;
  String match_time;
  String venue;
  String match_status;
  String series;
  String series_type;
  String team_a_image;
  String team_b_image;

  String match_type;
  String team_a_name;
  String team_b_name;
  String team_a_short;
  String team_b_short;

  MatchInfo({
    required this.team_a_name,
    required this.team_b_name,
    required this.team_a_short,
    required this.team_b_short,
    required this.team_a_image,
    required this.team_b_image,
    required this.match_date,
    required this.match_time,
    required this.match_status,
    required this.match_type,
    required this.series,
    required this.series_type,
    required this.venue,
  });
}
