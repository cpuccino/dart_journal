import 'package:dart_journal/dart_journal.dart';

class JournalDataMock extends JournalData {
  JournalDataMock({
    required int seed,
  }) : super(current: seed);
}
