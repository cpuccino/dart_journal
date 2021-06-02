abstract class JournalData<T> {
  T _current;

  T get current => _current;
  set current(T value) => _current = value;

  JournalData({
    required T current,
  }) : _current = current;
}
