abstract class JournalData<T> {
  T _current;

  T get current => _current;
  set current(value) => _current = value;

  JournalData({
    required T current,
  }) : _current = current;
}
