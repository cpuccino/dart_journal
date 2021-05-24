import 'package:dart_journal/dart_journal.dart';

import 'journal_data_mock.dart';

class JournalEntryMock extends JournalEntry<JournalDataMock> {
  int _payload;

  JournalEntryMock({
    required JournalDataMock data,
    int payload = 0,
  })  : _payload = payload,
        super(type: 'JournalEntryMock', data: data);

  @override
  void execute() {
    data.current = data.current + _payload;
  }

  @override
  void unexecute() {
    data.current = data.current - _payload;
  }
}
