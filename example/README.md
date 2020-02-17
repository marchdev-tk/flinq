# flinq_example

Demonstrates how to use the flinq package.

## Usage

### Pet model

```dart
import 'package:flinq/flinq.dart';

class Pet implements Comparable<Pet> {
  const Pet(this.name, this.nickname);

  final String name;
  final String nickname;

  @override
  int compareTo(Pet other) => name.compareTo(other.name);

  @override
  bool operator ==(Object other) =>
      other is Pet ? other.name == name && other.nickname == nickname : false;

  @override
  int get hashCode => name.hashCode + nickname.hashCode;

  @override
  String toString() => '$name ($nickname)';
}
```

### Iterable Common

```dart

final _emptyCollection = [];
final _singleItemCollection = ["item"];
final _numCollection = [3, 6, 2, 7, 9];
final _comparableCollection = [
  Pet("rat", "Mike"),
  Pet("dog", "Rex"),
  Pet("cat", "Lucy"),
];

void _firstOrNull() {
  print('---- firstOrNull ----\n');

  var result = _emptyCollection.firstOrNull; // []
  assert(result == null); // true
  print(result?.toString());

  result = _singleItemCollection.firstOrNull; // ["item"]
  assert(result == "item"); // true
  print(result?.toString());

  result = _numCollection.firstOrNull; // [3, 6, 2, 7, 9]
  assert(result == 3); // true
  print(result?.toString());

  result = _comparableCollection
      .firstOrNull; // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  assert(result == Pet("rat", "Mike")); // true
  print(result?.toString());

  print('---- ----------- ----\n');
}

void _lastOrNull() {
  print('---- lastOrNull ----\n');

  var result = _emptyCollection.lastOrNull; // []
  assert(result == null); // true
  print(result?.toString());

  result = _singleItemCollection.lastOrNull; // ["item"]
  assert(result == "item"); // true
  print(result?.toString());

  result = _numCollection.lastOrNull; // [3, 6, 2, 7, 9]
  assert(result == 9); // true
  print(result?.toString());

  result = _comparableCollection
      .lastOrNull; // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  assert(result == Pet("cat", "Lucy")); // true
  print(result?.toString());

  print('---- ---------- ----\n');
}

void _singleOrNull() {
  print('---- singleOrNull ----\n');

  var result = _emptyCollection.singleOrNull; // []
  assert(result == null); // true
  print(result?.toString());

  result = _singleItemCollection.singleOrNull; // ["item"]
  assert(result == "item"); // true
  print(result?.toString());

  try {
    result = _numCollection.singleOrNull; // [3, 6, 2, 7, 9]
    assert(false);
    print(result?.toString());
  } catch (e) {
    assert(e is StateError); // true (Too many elements)
    print(e.toString());
  }

  try {
    result = _comparableCollection
        .singleOrNull; // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
    assert(false);
    print(result?.toString());
  } catch (e) {
    assert(e is StateError); // true (Too many elements)
    print(e.toString());
  }

  print('---- ------------ ----\n');
}

void _firstOrNullWhere() {
  print('---- firstOrNullWhere ----\n');

  var result = _emptyCollection.firstOrNullWhere((item) => item != null); // []
  assert(result == null); // true
  print(result?.toString());

  result = _singleItemCollection
      .firstOrNullWhere((item) => item != "item"); // ["item"]
  assert(result == null); // true
  print(result?.toString());

  result =
      _numCollection.firstOrNullWhere((item) => item > 3); // [3, 6, 2, 7, 9]
  assert(result == 6); // true
  print(result?.toString());

  result = _comparableCollection.firstOrNullWhere(
    (item) => item.name.contains("at"),
  ); // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  assert(result == Pet("rat", "Mike")); // true
  print(result?.toString());

  print('---- ---------------- ----\n');
}

void _lastOrNullWhere() {
  print('---- lastOrNullWhere ----\n');

  var result = _emptyCollection.lastOrNullWhere((item) => item != null); // []
  assert(result == null); // true
  print(result?.toString());

  result = _singleItemCollection
      .lastOrNullWhere((item) => item != "item"); // ["item"]
  assert(result == null); // true
  print(result?.toString());

  result =
      _numCollection.lastOrNullWhere((item) => item > 3); // [3, 6, 2, 7, 9]
  assert(result == 9); // true
  print(result?.toString());

  result = _comparableCollection.lastOrNullWhere(
    (item) => item.name.contains("at"),
  ); // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  assert(result == Pet("cat", "Lucy")); // true
  print(result?.toString());

  print('---- --------------- ----\n');
}

void _singleOrNullWhere() {
  print('---- singleOrNullWhere ----\n');

  var result = _emptyCollection.singleOrNullWhere((item) => item != null); // []
  assert(result == null); // true
  print(result?.toString());

  result = _singleItemCollection
      .singleOrNullWhere((item) => item != "item"); // ["item"]
  assert(result == null); // true
  print(result?.toString());

  result =
      _numCollection.singleOrNullWhere((item) => item < 3); // [3, 6, 2, 7, 9]
  assert(result == 2); // true
  print(result?.toString());

  result = _comparableCollection.singleOrNullWhere(
    (item) => item.name == "rat",
  ); // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  assert(result == Pet("rat", "Mike")); // true
  print(result?.toString());

  print('---- ----------------- ----\n');
}

void _mapList() {
  print('---- mapList ----\n');

  final result = _numCollection.mapList((item) => item.toDouble());
  assert(result is List<double>);
  print(result.toString());

  print('---- ------- ----\n');
}

void _whereList() {
  print('---- whereList ----\n');

  final result = _numCollection.whereList((_) => _ > 4);
  assert(result == <int>[6, 7, 9]);
  print(result.toString());

  print('---- --------- ----\n');
}

void _whereMapList() {
  print('---- whereMapList ----\n');

  final result = _numCollection.whereMapList((_) => _ > 4, (_) => _.toDouble());
  assert(result == <double>[6, 7, 9]);
  print(result.toString());

  print('---- ------------ ----\n');
}

void _mapWhereList() {
  print('---- mapWhereList ----\n');

  final result =
      _numCollection.mapWhereList<double>((_) => _.toDouble(), (_) => _ > 4);
  assert(result == <double>[6, 7, 9]);
  print(result.toString());

  print('---- ------------ ----\n');
}

void _notNull() {
  print('---- notNull ----\n');

  final numCollection = [null, ..._numCollection, null];

  final result = numCollection.notNull;
  assert(result.toString() == _numCollection.toString());
  print(result.toString());

  print('---- ------- ----\n');
}

void iterableCommonTest() {
  _firstOrNull();
  _lastOrNull();
  _singleOrNull();
  _firstOrNullWhere();
  _lastOrNullWhere();
  _singleOrNullWhere();
  _mapList();
  _whereList();
  _whereMapList();
  _mapWhereList();
  _notNull();
}
```

### Iterable Comparable

```dart

final _emptyCollection = <Pet>[];
final _collection = [
  Pet("rat", "Mike"),
  Pet("dog", "Rex"),
  Pet("cat", "Lucy"),
];

void _min() {
  print('---- min ----\n');

  // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  var result = _collection.min;
  assert(result == Pet("cat", "Lucy")); // true
  print(result?.toString());

  try {
    result = _emptyCollection.min; // []
    assert(false);
    print(result?.toString());
  } catch (e) {
    assert(e is StateError); // true (No element)
    print(e.toString());
  }

  print('---- --- ----\n');
}

void _minWhere() {
  print('---- minWhere ----\n');

  // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  var result = _collection.minWhere((_) => _.name != "cat");
  assert(result == Pet("dog", "Rex")); // true
  print(result?.toString());

  try {
    result = _collection.minWhere((_) => _.name == "rabbit"); // []
    assert(false);
    print(result?.toString());
  } catch (e) {
    assert(e is StateError); // true (No element)
    print(e.toString());
  }

  print('---- --- ----\n');
}

void _minOrNull() {
  print('---- minOrNull ----\n');

  // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  var result = _collection.minOrNull;
  assert(result == Pet("cat", "Lucy")); // true
  print(result?.toString());

  result = _emptyCollection.minOrNull; // []
  assert(result == null); // true
  print(result?.toString());

  print('---- --------- ----\n');
}

void _minOrNullWhere() {
  print('---- minOrNullWhere ----\n');

  // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  var result = _collection.minOrNullWhere((_) => _.name != "cat");
  assert(result == Pet("dog", "Rex")); // true
  print(result?.toString());

  result = _emptyCollection.minOrNullWhere((_) => _.name == "rabbit"); // []
  assert(result == null); // true
  print(result?.toString());

  print('---- --------- ----\n');
}

void _max() {
  print('---- max ----\n');

  // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  var result = _collection.max;
  assert(result == Pet("rat", "Mike")); // true
  print(result?.toString());

  try {
    result = _emptyCollection.max; // []
    assert(false);
    print(result?.toString());
  } catch (e) {
    assert(e is StateError); // true (No element)
    print(e.toString());
  }

  print('---- --- ----\n');
}

void _maxWhere() {
  print('---- maxWhere ----\n');

  // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  var result = _collection.maxWhere((_) => _.name != "cat");
  assert(result == Pet("rat", "Mike")); // true
  print(result?.toString());

  try {
    result = _collection.maxWhere((_) => _.name == "rabbit"); // []
    assert(false);
    print(result?.toString());
  } catch (e) {
    assert(e is StateError); // true (No element)
    print(e.toString());
  }

  print('---- --- ----\n');
}

void _maxOrNull() {
  print('---- maxOrNull ----\n');

  // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  var result = _collection.maxOrNull;
  assert(result == Pet("rat", "Mike")); // true
  print(result?.toString());

  result = _emptyCollection.maxOrNull; // []
  assert(result == null); // true
  print(result?.toString());

  print('---- --------- ----\n');
}

void _maxOrNullWhere() {
  print('---- maxOrNullWhere ----\n');

  // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  var result = _collection.maxOrNullWhere((_) => _.name != "cat");
  assert(result == Pet("rat", "Mike")); // true
  print(result?.toString());

  result = _emptyCollection.maxOrNullWhere((_) => _.name == "rabbit"); // []
  assert(result == null); // true
  print(result?.toString());

  print('---- --------- ----\n');
}

void _group() {
  print('---- group ----\n');

  final result = _collection.group((item) => item.name.endsWith('at'));
  assert(result.toString() ==
      <bool, List<Pet>>{
        true: [
          Pet("rat", "Mike"),
          Pet("cat", "Lucy"),
        ],
        false: [
          Pet("dog", "Rex"),
        ],
      }.toString()); // true
  print(result?.toString());

  print('---- ----- ----\n');
}

void _groupMap() {
  print('---- groupMap ----\n');

  final result = _collection.groupMap(
      (item) => item.name.endsWith('at'), (group) => group.length);
  assert(result.toString() ==
      <bool, int>{
        true: 2,
        false: 1,
      }.toString()); // true
  print(result?.toString());

  print('---- -------- ----\n');
}

void iterableComparableTest() {
  _min();
  _minWhere();
  _minOrNull();
  _minOrNullWhere();
  _max();
  _maxWhere();
  _maxOrNull();
  _maxOrNullWhere();
  _group();
  _groupMap();
}
```

### Iterable Math

```dart
void iterableMathTest() {
  print('---- iterable math ----\n');

  final emptyCollection = <num>[];
  final oneCollection = [8]; // 8
  final manyCollection = [1, 3, 5, 7, 8, 2, 4]; // 30

  assert(emptyCollection.sum == 0); // true
  print(emptyCollection.sum);
  assert(oneCollection.sum == 8); // true
  print(oneCollection.sum);
  assert(manyCollection.sum == 30); // true
  print(manyCollection.sum);

  assert(emptyCollection.average == 0); // true
  print(emptyCollection.average);
  assert(oneCollection.average == 8); // true
  print(oneCollection.average);
  assert(manyCollection.average == 30 / 7); // true
  print(manyCollection.average);

  assert(emptyCollection.sumWhere((_) => _ > 4) == 0); // true
  print(emptyCollection.sumWhere((_) => _ > 4));
  assert(oneCollection.sumWhere((_) => _ > 4) == 8); // true
  print(oneCollection.sumWhere((_) => _ > 4));
  assert(manyCollection.sumWhere((_) => _ > 4) == 20); // true
  print(manyCollection.sumWhere((_) => _ > 4));

  assert(emptyCollection.averageWhere((_) => _ > 4) == 0); // true
  print(emptyCollection.averageWhere((_) => _ > 4));
  assert(oneCollection.averageWhere((_) => _ > 4) == 8); // true
  print(oneCollection.averageWhere((_) => _ > 4));
  assert(manyCollection.averageWhere((_) => _ > 4) == 20 / 3); // true
  print(manyCollection.averageWhere((_) => _ > 4));

  print('---- ------------- ----\n');
}
```

### Iterable Set

```dart
void iterableSetTest() {
  print('---- iterable set ----\n');

  final collectionOne = [2, 5, 8, 2];
  final collectionTwo = [1, 3, 5, 7];

  print(collectionOne.distinct); // [2, 5, 8]
  print(collectionOne.union(collectionTwo)); // [2, 5, 8, 1, 3, 7]
  print(collectionOne.intersection(collectionTwo)); // [5]
  print(collectionOne.difference(collectionTwo)); // [2, 8]
  print(collectionTwo.difference(collectionOne)); // [1, 3, 7]

  print(collectionOne.distinctWhere((_) => _ > 4)); // [2, 5, 8]
  print(collectionOne.unionWhere(collectionTwo, (_) => _ > 4)); // [5, 8, 7]
  print(collectionOne.intersectionWhere(collectionTwo, (_) => _ < 4)); // []
  print(collectionOne.differenceWhere(collectionTwo, (_) => _ < 4)); // [2]
  print(collectionTwo.differenceWhere(collectionOne, (_) => _ < 4)); // [1, 3]
 
  print('---- ------------ ----\n');
}
```

## Getting Started

For help getting started with Dart, view 
[online documentation](https://dart.dev/docs), which offers tutorials, 
samples, guidance, and a full API reference.
