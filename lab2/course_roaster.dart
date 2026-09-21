void main() {
  printWelcome('Course Roster Manager');

  // Part 2
  const int maxCapacity = 4;
  final DateTime createdAt = DateTime.now(); // legaly can't be const as DateTime.now() checks the current system clock
  String courseTitle = 'CS201: Mobile App Development';
  int capacity = maxCapacity;
  double creditHours = 3.0;
  bool isOpen = true;

  List<String> enrolledStudents = ['Aiden', 'Maria', 'Jamal'];
  Set<String> waitlist = {'Priya', 'Noah'};
  Map<String, int> attendanceCount = {'Aiden': 3, 'Maria': 4, 'Jamal': 2};

  // Interpolated string
  print('$courseTitle | Capacity: $capacity | Enrolled: ${enrolledStudents.length}');

  // Part 3
  String? instructorEmail;
  print(instructorEmail ?? 'TBA');
  late String enrollmentCode;
  enrollmentCode = generateCode(courseTitle);
  print('Enrollment code: $enrollmentCode');
  print('Email length: ${instructorEmail?.length ?? 0}');

  // Part 4
  String rawNames = ' Aiden , maria, JAMAL, Priya ';
  List<String> cleanNames = [];
  for (var name in rawNames.split(',')) {
    cleanNames.add(name.trim());
  }

  // Multi-line
  String courseDescription = '''
Course: $courseTitle
Credits: $creditHours
Created on: $createdAt
''';
  print(courseDescription);
  print('Seats left: ${capacity - enrolledStudents.length}');

  // Part 5
  int fullGroups = enrolledStudents.length ~/ 3;
  int leftover = enrolledStudents.length % 3;
  print('Full groups of 3: $fullGroups, leftover: $leftover');

  Object formInput = 'twenty-two';
  if (formInput is String) {
    print('Hello');
  }
  if (formInput is! int) {
    print('My name is Huzaifa');
  }

  var report = StringBuffer()
    ..write(courseTitle)
    ..write(' | Cap: $capacity')
    ..write(' | Roster: ${enrolledStudents.length}');
  print('Report: ${report.toString()}');

  List<String>? extraNotes;
  extraNotes?..add('Room change pending');
  print('Extra notes: $extraNotes');

  int? bonusSeats;
  bonusSeats ??= 0;
  print('Bonus seats: $bonusSeats');

  // Part 6
  if (isOpen && enrolledStudents.length < capacity) {
    print("You're in! Welcome aboard.");
  } else {
    print("Enrollment is closed or course is full.");
  }

  int enrollmentStatusCode = 200;
  switch (enrollmentStatusCode) {
    case 200:
      print('Enrolled');
      break;
    case 404:
      print('Course not found');
      break;
    default:
      print('Unknown error');
      break;
  }

  String statusTag = isOpen ? 'OPEN' : 'FULL';
  print(statusTag);

  // Part 7
  for (var student in enrolledStudents) {
    print(student);
  }
  
  attendanceCount.forEach((student, count) {
    print('$student: $count');
  });

  List<String> announcements = [
    'Welcome to $courseTitle',
    if (!isOpen) 'Course is FULL waitlist open',
    for (var student in waitlist) 'Reminder: $student, please confirm attendance',
  ];

  for (var announcement in announcements) {
    print(announcement);
  }
}

String generateCode(String title) =>
    title.substring(0, 2).toUpperCase() + '101';

/// Prints a welcome message with app name
void printWelcome(String appName) {
  print('=== $appName ===');
}