// library_lab.dart  -  Campus Library System
// Name: Huzaifa Qayyum   Roll no: 04072313048

const String rollNo = '04072313048';   // e.g. '21F-0347'

// ===== Seeded settings (generated from YOUR roll number). Do not edit. =====
final int seed = int.parse(rollNo.substring(rollNo.length - 2));
final int t = seed ~/ 10;   // tens digit
final int u = seed % 10;    // units digit

const List<String> titles = [
  'Dart Basics', 'Flutter In Action', 'Data Structures', 'Operating Systems',
  'Mobile Design', 'Clean Code', 'Algorithms Unlocked', 'Computer Networks',
  'Database Systems', 'Software Testing',
];

int yearOf(int i) => 1995 + 2 * i + t;      // publication year of titles[i]
final int feePerDay = 5 + t;                // late fee per day, in rupees
final int daysLate = 3 + (t + u) % 6;       // normal number of days late
final int daysBig = 10 + u;                 // a long overdue period
final int feeCap = 150 + 10 * t;            // no single fee may exceed this
final int renewLimit = 1 + t % 3;           // renewals allowed per item
final int renewAttempts = 2 + u;            // renewal attempts made in Step 5
final int shelfSize = 3 + u % 4;            // items on the shelf in Steps 9-10
// ===========================================================================
// task 5.1
mixin Renewable {
  int renewals = 0;
  bool renew(int limit) {
    if (renewals >= limit) {
      return false;
    }
    renewals++;
    return true;
  }
}
// task 1.1
abstract class LibraryItem {
  final String title;
  final int year;
  LibraryItem(this.title, this.year);
  // task 2.1
  String describe() => '$title ($year)';
  // task 3.1
  int lateFee(int days);
}
// task 4.1
abstract class Borrowable {
  bool get isAvailable;
  void borrow();
  void giveBack();
}
// task 1.2
class Book extends LibraryItem with Renewable implements Borrowable {
  final int pages;
  bool _out = false;
  Book(super.title, super.year, this.pages);
  // task 2.2
  @override
  String describe() => '${super.describe()}, $pages pages';
  // task 3.2
  @override 
  int lateFee(int days) => days * feePerDay;
  // task 4.2
  @override
  bool get isAvailable => !_out;

  @override
  void borrow() => _out = true;

  @override
  void giveBack() => _out = false;
}
// task 1.3
Book mainBook() =>
 Book(titles[u], yearOf(u), 100 + 3 * seed);

 // task 2.3
 class Magazine extends LibraryItem {
  final int issue;
  Magazine(super.title, super.year, this.issue);

  @override
  String describe() => '${super.describe()}, issue $issue';
  // task 3.2
  @override
  int lateFee(int days) => days * (feePerDay ~/ 2);
}

Magazine mainMagazine() {
  final int i = (u + 1) % 10;
  return Magazine(titles[i], yearOf(i), 1 + (t + u) % 12);
}

// task 3.3 && 5.2
class Dvd extends LibraryItem with Renewable {
  final int minutes;
  Dvd(super.title, super.year, this.minutes);

  @override
  String describe() => '${super.describe()}, $minutes min';

  @override
  int lateFee(int days) => days * feePerDay * 2;
}

Dvd mainDvd() {
  final int i = (u + 2) % 10;
  return Dvd(titles[i], yearOf(i), 90 + seed % 40);
}
// task 6.1
enum MemberType {
  student(3, 50),
  faculty(10, 20),
  guest(1, 0);
  final int maxLoans;
  final int discountPercent;

  const MemberType(this.maxLoans, this.discountPercent);
  int applyDiscount(int fee) => fee - (fee * discountPercent ~/ 100);
}
// task 7.1
extension MoneyText on int {
  String get rs => 'Rs $this';
}
extension Initials on String {
  String get initials => split(' ').map((w) => w[0]).join();
}
extension ShelfMath on List<LibraryItem> {
  int totalLateFee(int days) =>
      fold(0, (sum, item) => sum + item.lateFee(days));
}
// task 8.1
class Fine {
  final int amount;
  const Fine(this.amount);
  Fine operator +(Fine o) => Fine(amount + o.amount);
  bool operator >(Fine o) => amount > o.amount;
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Fine && other.amount == amount);

  @override
  int get hashCode => amount.hashCode;

  @override
  String toString() => 'Fine ($amount)';
}
void main() {
  print('Seed: $seed (t=$t, u=$u)');
  step1();
  step2();
  step3();
  step4();
  step5();
  step6();
  step7();
  step8();
  step9();
  step10();
}

void step1() {
  print('--- Step 1 ---');
  final Book b = mainBook();
  final LibraryItem item = b;
  print('Step 1: ${b.title} (${b.year}),${b.pages} pages');
  print('Step 1: stored as LibraryItem: ${item.title}');
  print('Step 1: runtimeType = ${item.runtimeType}');
  // The item.pages is a compile error because the static type of 'item' is LibraryItem, which does not have a pages field
}
void step2() {
  print('--- Step 2 ---');
  print('Step 2: ${mainBook().describe()}');
  print('Step 2: ${mainMagazine().describe()}');
  // If we mistyped the method as descibe() without @override, dart will treat it as a new separate method instead of overriding
}
void step3() {
  print('--- Step 3 ---');
  print('Step 3: Book late fee for $daysLate days = ${mainBook().lateFee(daysLate)}');
  print('Step 3: Magazine late fee for $daysLate days = ${mainMagazine().lateFee(daysLate)}');
  print('Step 3: Dvd late fee for $daysLate days = ${mainDvd().lateFee(daysLate)}');
}
void step4() {
  print('--- Step 4 ---');
  final Book book = mainBook();
  print('Step 4: available? ${book.isAvailable}');
  book.borrow();
  print('Step 4: after borrow? ${book.isAvailable}');
  book.giveBack();
  print('Step 4: after return? ${book.isAvailable}');
// task 4.3
  final List<LibraryItem> items = [book, mainMagazine(), mainDvd()];
  for (final item in items) {
    print('Step 4: ${item.runtimeType} borrowable? ${item is Borrowable}');
  }
  // extends inherits actual code and use dart's single parent limit and implements only sets the rules
}
void step5() {
  print('--- Step 5 ---');
  // task 5.3
  final Book book = mainBook();
  int ok = 0;
  for (int attempt = 0; attempt < renewAttempts; attempt++) {
    if (book.renew(renewLimit)) {
      ok++;
    }
  }
  print('Step 5: renewed $ok of $renewAttempts attempts (limit $renewLimit)');
  print('Step 5: renew once more? ${book.renew(renewLimit)}');
  print('Step 5: dvd can renew too? ${mainDvd().renew(1)}');
// A mixin lets Book and Dvd share renew() without giving it to Magazine
}
void step6() {
  print('--- Step 6 ---');
  // task 6.2
  final MemberType type = MemberType.values[seed % 3];
  final int fee = mainBook().lateFee(daysLate);
  print('Step 6: member type ${type.name} (index ${type.index})');
  print('Step 6: max loans = ${type.maxLoans}');
  print('Step 6: book fee $fee -> ${type.applyDiscount(fee)} after discount');
// Enums MemberType prevent spelling mistake and invalid values at compile time
}
void step7() {
  print('--- Step 7 ---');
  // task 7.2
  final MemberType type = MemberType.values[seed % 3];
  final int discountedFee = type.applyDiscount(mainBook().lateFee(daysLate));
  final List<LibraryItem> shelf = [mainBook(), mainMagazine(), mainDvd()];

  print('Step 7: ${discountedFee.rs}');
  print('Step 7: initials of "${titles[u]}" = ${titles[u].initials}');
  print('Step 7: shelf fee for $daysLate days = ${shelf.totalLateFee(daysLate).rs}');
}
void step8() {
  print('--- Step 8 ---');
  // task 8.2
  final Fine f1 = Fine(mainBook().lateFee(daysLate));
  final Fine f2 = Fine(mainMagazine().lateFee(daysLate));
  print('Step 8: $f1 + $f2 = ${f1 + f2}');
  print('Step 8: first bigger? ${f1 > f2}');
  print('Step 8: equal copies? ${f1 == Fine(f1.amount)}');
  print('Step 8: set size = ${{f1, Fine(f1.amount), f2}.length}');
}
void step9() { print('--- Step 9 ---'); }
void step10() { print('--- Step 10 ---'); }
