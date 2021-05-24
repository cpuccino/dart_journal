import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'package:dart_journal/dart_journal.dart';

import 'journal_data_mock.dart';
import 'journal_entry_mock.dart';

main() {
  test('Journal should reflect recorded entry updates', () {
    var journal = Journal();
    var journalData = JournalDataMock(seed: 0);

    journal.record(JournalEntryMock(data: journalData, payload: 5));
    expect(journalData.current, 5);

    journal.record(JournalEntryMock(data: journalData, payload: 2));
    expect(journalData.current, 7);
  });

  test('Journal should allow jumping to the previous entry', () {
    var journal = Journal();
    var journalData = JournalDataMock(seed: 0);

    journal.record(JournalEntryMock(data: journalData, payload: 8));
    journal.record(JournalEntryMock(data: journalData, payload: 2));
    journal.seekPrevious();

    expect(journalData.current, 8);
  });

  test('Journal should ignore jumping to a previous entry when the cursor is at the start', () {
    var journal = Journal();
    var journalData = JournalDataMock(seed: 1);

    journal.seekPrevious();
    journal.record(JournalEntryMock(data: journalData, payload: 8));
    expect(journalData.current, 9);
    journal.record(JournalEntryMock(data: journalData, payload: 2));
    expect(journalData.current, 11);

    journal.seekPrevious();
    expect(journalData.current, 9);
    journal.seekPrevious();
    expect(journalData.current, 1);

    journal.seekPrevious();
    expect(journalData.current, 1);
  });
}
