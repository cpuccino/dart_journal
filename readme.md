# Dart Journal

Dart journal is a history package built with dart that is able to recreate the previous and the current state `(record, seekPrevious, seekNext)`

<br />

### Implementation details

- A journal is a store that contains entries and keeps track of what is current using a cursor
- A journal entry implements an execute and unexecute function that is used to recreate the previous and the current state
- A journal data is a wrapper for the object that gets manipulated by a journal entry
- A cursor is a piece of data that contains the index of what is the current entry