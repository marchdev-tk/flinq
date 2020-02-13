# flinq_example

Demonstrates how to use the flinq package.

## Usage

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

void iterableCommonTest() {
  final emptyCollection = [];
  final singleItemCollection = ["item"];
  final numCollection = [3, 6, 2, 7, 9];
  final comparableCollection = [
    Pet("rat", "Mike"),
    Pet("dog", "Rex"),
    Pet("cat", "Lucy"),
  ];

/* ****************** getting first item of collection ****************** */
  var firstOrNull = emptyCollection.firstOrNull; // []
  assert(firstOrNull == null); // true

  firstOrNull = singleItemCollection.firstOrNull; // ["item"]
  assert(firstOrNull == "item"); // true

  firstOrNull = numCollection.firstOrNull; // [3, 6, 2, 7, 9]
  assert(firstOrNull == 3); // true

  firstOrNull = comparableCollection
      .firstOrNull; // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  assert(firstOrNull == Pet("rat", "Mike")); // true

/* ****************** getting last item of collection ****************** */
  var lastOrNull = emptyCollection.lastOrNull; // []
  assert(lastOrNull == null); // true

  lastOrNull = singleItemCollection.lastOrNull; // ["item"]
  assert(lastOrNull == "item"); // true

  lastOrNull = numCollection.lastOrNull; // [3, 6, 2, 7, 9]
  assert(lastOrNull == 9); // true

  lastOrNull = comparableCollection
      .lastOrNull; // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  assert(lastOrNull == Pet("cat", "Lucy")); // true

/* ****************** getting single item of collection ****************** */
  var singleOrNull = emptyCollection.singleOrNull; // []
  assert(singleOrNull == null); // true

  singleOrNull = singleItemCollection.singleOrNull; // ["item"]
  assert(singleOrNull == "item"); // true

  try {
    singleOrNull = numCollection.singleOrNull; // [3, 6, 2, 7, 9]
    assert(false);
  } catch (e) {
    assert(e is StateError); // true (Too many elements)
  }

  try {
    singleOrNull = comparableCollection
        .singleOrNull; // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
    assert(false);
  } catch (e) {
    assert(e is StateError); // true (Too many elements)
  }

/* ****************** getting conditional first item of collection ****************** */
  var conditionalFirstOrNull =
      emptyCollection.firstOrNullWhere((item) => item != null); // []
  assert(conditionalFirstOrNull == null); // true

  conditionalFirstOrNull = singleItemCollection
      .firstOrNullWhere((item) => item != "item"); // ["item"]
  assert(conditionalFirstOrNull == null); // true

  conditionalFirstOrNull =
      numCollection.firstOrNullWhere((item) => item > 3); // [3, 6, 2, 7, 9]
  assert(conditionalFirstOrNull == 6); // true

  conditionalFirstOrNull = comparableCollection.firstOrNullWhere(
    (item) => item.name.contains("at"),
  ); // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  assert(conditionalFirstOrNull == Pet("rat", "Mike")); // true

/* ****************** getting conditional last item of collection ****************** */
  var conditionalLastOrNull =
      emptyCollection.lastOrNullWhere((item) => item != null); // []
  assert(conditionalLastOrNull == null); // true

  conditionalLastOrNull = singleItemCollection
      .lastOrNullWhere((item) => item != "item"); // ["item"]
  assert(conditionalLastOrNull == null); // true

  conditionalLastOrNull =
      numCollection.lastOrNullWhere((item) => item > 3); // [3, 6, 2, 7, 9]
  assert(conditionalLastOrNull == 9); // true

  conditionalLastOrNull = comparableCollection.lastOrNullWhere(
    (item) => item.name.contains("at"),
  ); // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  assert(conditionalLastOrNull == Pet("cat", "Lucy")); // true

/* ****************** getting conditional single item of collection ****************** */
  var conditionalSingleOrNull =
      emptyCollection.singleOrNullWhere((item) => item != null); // []
  assert(conditionalSingleOrNull == null); // true

  conditionalSingleOrNull = singleItemCollection
      .singleOrNullWhere((item) => item != "item"); // ["item"]
  assert(conditionalSingleOrNull == null); // true

  conditionalSingleOrNull =
      numCollection.singleOrNullWhere((item) => item < 3); // [3, 6, 2, 7, 9]
  assert(conditionalSingleOrNull == 2); // true

  conditionalSingleOrNull = comparableCollection.singleOrNullWhere(
    (item) => item.name == "rat",
  ); // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  assert(conditionalSingleOrNull == Pet("rat", "Mike")); // true

/* ****************** mapList collection ****************** */
  final collection = Iterable<int>.generate(10);
  assert(collection is Iterable<int>);
  final mappedCollection = collection.mapList((item) => item.toDouble());
  assert(mappedCollection is List<double>);
}

void iterableComparableTest() {
  final emptyCollection = <Pet>[];
  final collection = [
    Pet("rat", "Mike"),
    Pet("dog", "Rex"),
    Pet("cat", "Lucy"),
  ];

/* ****************** getting min item of collection ****************** */
  var min = collection
      .min; // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  assert(min == Pet("cat", "Lucy")); // true

  try {
    min = emptyCollection.min; // []
    assert(false);
  } catch (e) {
    assert(e is StateError); // true (No element)
  }

  var minOrNull = collection
      .minOrNull; // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  assert(minOrNull == Pet("cat", "Lucy")); // true

  minOrNull = emptyCollection.minOrNull; // []
  assert(minOrNull == null); // true

  /* ****************** getting min item of collection ****************** */
  var max = collection
      .max; // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  assert(max == Pet("rat", "Mike")); // true

  try {
    max = emptyCollection.max; // []
    assert(false);
  } catch (e) {
    assert(e is StateError); // true (No element)
  }

  var maxOrNull = collection
      .maxOrNull; // [ Pet("rat", "Mike"), Pet("dog", "Rex"), Pet("cat", "Lucy") ]
  assert(maxOrNull == Pet("rat", "Mike")); // true

  maxOrNull = emptyCollection.maxOrNull; // []
  assert(maxOrNull == null); // true

  /* ****************** grouping items of collection ****************** */
  Map<bool, List<Pet>> group =
      collection.group((item) => item.name.endsWith('at'));
  assert(group.toString() ==
      <bool, List<Pet>>{
        true: [
          Pet("rat", "Mike"),
          Pet("cat", "Lucy"),
        ],
        false: [
          Pet("dog", "Rex"),
        ],
      }.toString()); // true

  /* ****************** grouping and mapping items of collection ****************** */
  final groupMapped = collection.groupMap(
      (item) => item.name.endsWith('at'), (group) => group.length);
  assert(groupMapped.toString() ==
      <bool, int>{
        true: 2,
        false: 1,
      }.toString()); // true
}

void iterableMathTest() {
  final emptyCollection = <num>[];
  final oneCollection = [8]; // 8
  final manyCollection = [1, 3, 5, 7, 8, 2, 4]; // 30

  assert(emptyCollection.sum == 0); // true
  assert(oneCollection.sum == 8); // true
  assert(manyCollection.sum == 30); // true

  assert(emptyCollection.average == 0); // true
  assert(oneCollection.average == 8); // true
  assert(manyCollection.average == 30 / 7); // true
}

iterableSetTest() {
  final collectionOne = [2, 5, 8, 2];
  final collectionTwo = [1, 3, 5, 7];

  print(collectionOne.distinct); // [2, 5, 8]
  print(collectionOne.union(collectionTwo)); // [2, 5, 8, 1, 3, 7]
  print(collectionOne.intersection(collectionTwo)); // [5]
  print(collectionOne.difference(collectionTwo)); // [2, 8]
  print(collectionTwo.difference(collectionOne)); // [1, 3, 7]
}

main(List<String> arguments) {
  iterableCommonTest();
  iterableComparableTest();
  iterableMathTest();
  iterableSetTest();
}

```

## Getting Started

For help getting started with Dart, view 
[online documentation](https://dart.dev/docs), which offers tutorials, 
samples, guidance, and a full API reference.
