import 'package:dart_journal/src/journal_cursor.dart';

import 'journal_entry.dart';

class Journal {
  final String _key;
  String get key => _key;

  final List<JournalEntry> _entries;
  int get length => _entries.length;

  JournalCursor _cursor;

  Journal({
    String key = '_default',
  })  : _key = key,
        _entries = [],
        _cursor = JournalCursor();

  void record(JournalEntry entry) {
    if (_cursor.index < _entries.length - 1) {
      _entries.removeRange(_cursor.index + 1, _entries.length);
    }

    entry.execute();
    _entries.add(entry);

    _cursor.index = _entries.length - 1;
    print('$key: Recording entry [${_cursor}] of type [${entry.type}]');
  }

  bool _indexIsValid(int cursor) {
    return cursor > -1 && cursor < _entries.length;
  }

  void seekPrevious() {
    var currentCursorIndex = _cursor.index;

    if (_indexIsValid(currentCursorIndex)) {
      var entry = _entries[currentCursorIndex];
      entry.unexecute();
    }

    var previousCursorIndex = _cursor.index - 1;
    if (previousCursorIndex < -1) return;

    _cursor.index = previousCursorIndex;
  }

  void seekNext() {
    var nextCursorIndex = _cursor.index + 1;
    if (!_indexIsValid(nextCursorIndex)) return;

    var entry = _entries[nextCursorIndex];
    entry.execute();

    _cursor.index = nextCursorIndex;
  }

  bool isInitial() {
    return _cursor.index == -1;
  }
}
