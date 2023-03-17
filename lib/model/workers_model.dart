class Worker {
  String firstname;
  String name;
  String startdate;
  String wages;
  List<String> workingdays;
  String team;

  Worker({
    required this.firstname,
    required this.name,
    required this.startdate,
    required this.wages,
    required this.workingdays,
    required this.team,
  });

  Worker.fromJson(Map<String, dynamic> json)
      : firstname = json['firstname'],
        name = json['name'],
        startdate = json['startdate'],
        wages = json['wages'],
        workingdays = json['workingdays'].cast<String>(),
        team = json['team'];

  Map<String, dynamic> toJson() {
    return {
      'firstname': firstname,
      'name': name,
      'startdate': startdate,
      'wages': wages,
      'workingdays': workingdays,
      'team': team,
    };
  }
}
