class Audit {
  final int trailId;
  final String dateEntered;
  final String dayOnly;
  final String month;
  final String year;

  final String activity;
  final String actionDisplay;

  final String deptName;

  final String empFname;
  final String empMname;
  final String empLname;

  const Audit({
    required this.trailId,
    required this.dateEntered,
    required this.dayOnly,
    required this.month,
    required this.year,
    required this.activity,
    required this.actionDisplay,
    required this.deptName,
    required this.empFname,
    required this.empMname,
    required this.empLname,
  });
 
}
