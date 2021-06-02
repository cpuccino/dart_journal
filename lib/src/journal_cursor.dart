class JournalCursor {
  int _index;
  int get index => _index;
  set index(int value) => _index = value;

  JournalCursor() : _index = -1;
}
