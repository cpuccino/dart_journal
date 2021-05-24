class JournalCursor {
  int _index;
  int get index => _index;
  set index(value) => _index = value;

  JournalCursor() : _index = -1;

  void next() {
    _index + 1;
  }

  void previous() {
    _index - 1;
  }
}
