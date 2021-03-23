# flinq

![Build](https://github.com/marchdev-tk/flinq/workflows/build/badge.svg)
[![codecov](https://codecov.io/gh/marchdev-tk/flinq/branch/master/graph/badge.svg)](https://codecov.io/gh/marchdev-tk/flinq)
[![Pub](https://img.shields.io/pub/v/flinq.svg)](https://pub.dartlang.org/packages/flinq)
![GitHub](https://img.shields.io/github/license/marchdev-tk/flinq)
![GitHub stars](https://img.shields.io/github/stars/marchdev-tk/flinq?style=social)

Extended capabilities for collections.
It's a bunch of shortcuts to avoid unnecesary boilerplate work with collections.

## Getting Started

This package will help you to reduce the amount of boilerplate code by adding folowing extensions for `Iterable`s:

* getter `firstOrNull` and method `firstOrNullWhere` for getting first value, and if it will not be found returns `null`

* getter `lastOrNull` and method `lastOrNullWhere` for getting last value, and if it will not be found returns `null`

* getter `singleOrNull` and method `singleOrNullWhere` for getting single value, and if it will not be found returns `null`, and if there will be too many elements it'll also return `null`

* method `mapList`, which maps collection and casts it to `List`

* method `whereList`, which filters collection and casts it to `List`

* method `mapWhereList`, which maps collection, then filters it and then casts it to `List`

* method `whereMapList`, which filters collection, then maps collection and then casts it to `List`

* getter `notNull` for getting only **not null** values from the collection

* method `group` and `groupMap` for grouping a collection

* getter `min`/`minOrNull` and `max`/`maxOrNull` for getting minimal or maximal value from collection of `Comparable`s

* method `minWhere`/`minOrNullWhere` and `maxWhere`/`maxOrNullWhere` for getting minimal or maximal value from filtered collection of `Comparable`s

* getter `sum` and `average` for getting sum and average from collection of `num`s

* method `sumWhere` and `averageWhere` for getting sum and average from filtered collection of `num`s

* getter `distinct` and method `distinctWhere` which will return `List` with unique values in collection

* method `union` and `unionWhere` which will return `List` with union of two collections with only unique values in resulting collection

* method `intersection` and `intersectionWhere` which will return `List` with elements that contains both collections with only unique values in resulting collection

* method `difference` and `differenceWhere` which will return `List` with difference between two collections with only unique values in resulting collection

## Examples

`Iterable` extension can be used like this:

### Common

* **firstOrNull** and **firstOrNullWhere**

```dart
final firstOrNull = [].firstOrNull; // null
// or
final firstOrNull = [3, 6, 2, 7, 9].firstOrNullWhere((item) => item > 10); // null
```

* **lastOrNull** and **lastOrNullWhere**

```dart
final lastOrNull = [].lastOrNull; // null
// or
final lastOrNull = [3, 6, 2, 7, 9].lastOrNullWhere((item) => item > 10); // null
```

* **singleOrNull** and **singleOrNullWhere**

```dart
final singleOrNull = [].singleOrNull; // null
// or
final singleOrNull = [3, 6, 2, 7, 9].singleOrNullWhere((item) => item > 3); // null
```

* **mapList**

```dart
List<double> mappedList = [3, 6, 2, 7, 9].mapList((item) => item.toDouble());
```

* **whereList**

```dart
List<int> filteredList = [3, 6, 2, 7, 9].whereList((item) => item > 4);
```

* **whereMapList**

```dart
List<double> filteredMappedList = [3, 6, 2, 7, 9].whereMapList((item) => item > 4, (item) => item.toDouble());
```

* **mapWhereList**

```dart
List<double> mappedFilteredList = [3, 6, 2, 7, 9].mapWhereList((item) => item.toDouble(), (item) => item > 4);
```

* **notNull**

```dart
Iterable<int> notNullIterable = [3, 6, 2, null, 7, 9].notNull;
```

* **group**

```dart
final collection = [
    Pet("rat", "Mike"),
    Pet("dog", "Rex"),
    Pet("cat", "Lucy"),
];

/*
<bool, List<Pet>>{
    true: [
        Pet("rat", "Mike"),
        Pet("cat", "Lucy"),
    ],
    false: [
        Pet("dog", "Rex"),
    ],
}
*/
final group = collection.group((item) => item.name.endsWith('at'));
```

* **groupMap**

```dart
final collection = [
    Pet("rat", "Mike"),
    Pet("dog", "Rex"),
    Pet("cat", "Lucy"),
];

/*
<bool, int>{
    true: 2,
    false: 1,
}
*/
final groupMapped = collection.groupMap(
      (item) => item.name.endsWith('at'), (group) => group.length);
```

### Comparable

* **min** and **minOrNull**

```dart
final min = [3, 6, 2, 7, 9].min; // 2
// or
final min = [].minOrNull; // null
```

* **minWhere** and **minOrNullWhere**

```dart
final min = [3, 6, 2, 7, 9].minWhere((_) => _ > 4); // 6
// or
final min = [3, 2].minOrNullWhere((_) => _ > 4); // null
```

* **max** and **maxOrNull**

```dart
final max = [3, 6, 2, 7, 9].max; // 9
// or
final max = [].maxOrNull; // null
```

* **maxWhere** and **maxOrNullWhere**

```dart
final max = [3, 6, 2, 7, 9].maxWhere((_) => _ < 4); // 3
// or
final max = [3, 2].maxOrNullWhere((_) => _ > 4); // null
```

### Math

* **sum**

```dart
final sum = [3, 6, 2, 7, 9].sum; // 27
```

* **average**

```dart
final average = [1, 3, 5, 7, 4, 4].average; // 4
```

* **sumWhere**

```dart
final sum = [3, 6, 2, 7, 9].sumWhere((_) => _ > 4); // 22
```

* **averageWhere**

```dart
final average = [1, 3, 5, 7, 4, 4].averageWhere((_) => _ > 4); // 6
```

### Set

* **distinct**

```dart
final collectionOne = [2, 5, 8, 2];

final distinctCollection = collectionOne.distinct; // [2, 5, 8]
```

* **distinctWhere**

```dart
final collectionOne = [2, 5, 8, 2];

final distinctCollection = collectionOne.distinctWhere((_) => _ > 4); // [5, 8]
```

* **union**

```dart
final collectionOne = [2, 5, 8, 2];
final collectionTwo = [1, 3, 5, 7];

final unitedCollection = collectionOne.union(collectionTwo); // [2, 5, 8, 1, 3, 7]
```

* **unionWhere**

```dart
final collectionOne = [2, 5, 8, 2];
final collectionTwo = [1, 3, 5, 7];

final unitedCollection = collectionOne.unionWhere(collectionTwo, (_) => _ > 4); // [5, 8, 7]
```

* **intersection**

```dart
final collectionOne = [2, 5, 8, 2];
final collectionTwo = [1, 3, 5, 7];

final intersectedCollection = collectionOne.intersection(collectionTwo); // [5]
```

* **intersectionWhere**

```dart
final collectionOne = [2, 5, 8, 2];
final collectionTwo = [1, 3, 5, 7];

final intersectedCollection = collectionOne.intersectionWhere(collectionTwo, (_) => _ < 4); // []
```

* **difference**

```dart
final collectionOne = [2, 5, 8, 2];
final collectionTwo = [1, 3, 5, 7];

final differedCollection = collectionOne.difference(collectionTwo); // [2, 8]
// or
final differedCollection = collectionTwo.difference(collectionOne); // [1, 3, 7]
```

* **differenceWhere**

```dart
final collectionOne = [2, 5, 8, 2];
final collectionTwo = [1, 3, 5, 7];

final differedCollection = collectionOne.differenceWhere(collectionTwo, (_) => _ < 4); // [2]
// or
final differedCollection = collectionTwo.differenceWhere(collectionOne, (_) => _ < 4); // [1, 3]
```

## Feature requests and Bug reports

Feel free to post a feature requests or report a bug [here](https://github.com/marchdev-tk/flinq/issues).
