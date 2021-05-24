import 'journal_entry.dart';

class Journal {
  final String _key;
  String get key => _key;

  final List<JournalEntry> _entries;
  int get length => _entries.length;

  int _cursor = -1;

  Journal({
    String key = '_default',
  })  : _key = key,
        _entries = [];

  void record(JournalEntry entry) {
    if (_cursor < _entries.length - 1) {
      _entries.removeRange(_cursor + 1, _entries.length);
    }

    entry.execute();
    _entries.add(entry);

    _cursor = _entries.length - 1;
    print('$key: Recording entry [${_cursor}] of type [${entry.type}]');
  }

  bool _cursorIsValid(int cursor) {
    return cursor > -1 && cursor < _entries.length;
  }

  void seekPrevious() {
    if (_cursorIsValid(_cursor)) {
      var entry = _entries[_cursor];
      entry.unexecute();
    }

    var previousCursor = _cursor - 1;
    if (previousCursor < -1) return;

    _cursor = previousCursor;
  }

  void seekNext() {
    var nextCursor = _cursor + 1;
    if (!_cursorIsValid(nextCursor)) return;

    var entry = _entries[nextCursor];
    entry.execute();

    _cursor = nextCursor;
  }

  bool isInitial() {
    return _cursor == -1;
  }
}
