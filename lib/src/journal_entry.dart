abstract class JournalEntry<T> {
  final String _type;
  final T _data;

  String get type => _type;
  T get data => _data;

  JournalEntry({
    String type = 'Default',
    required T data,
  })   : _type = type,
        _data = data;

  void execute();

  void unexecute();
}
