# flinq

Extended capabilities for collections.
It's a bunch of shortcuts to avoid unnecesary boilerplate work with collections.

## Getting Started

This package will help you to reduce the amount of boilerplate code by adding folowing extensions for `Iterable`s:

* getter `firstOrNull` and method `firstOrNullWhere(bool test(T))` for getting first value, and if it will not be found returns `null`

* getter `lastOrNull` and method `lastOrNullWhere(bool test(T))` for getting last value, and if it will not be found returns `null`

* getter `singleOrNull` and method `singleOrNullWhere(bool test(T))` for getting single value, and if it will not be found returns `null`, and if there will be too many 
elements it'll throw the `StateError`

* method `mapList`, which maps collection and casts it to `List`

* getter `min` and `max` for getting minimal or maximal value from collection of `Comparable`s

* getter `sum` and `average` for getting sum and average from collection of `num`s

* getter `distinct` which will return `List` with unique values in collection

* method `union` which will return `List` with union of two collections with only unique values in resulting collection

* method `intersection` which will return `List` with elements that contains both collections with only unique values in resulting collection

* method `difference` which will return `List` with difference between two collections with only unique values in resulting collection

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
List<double> mappedIterable = [3, 6, 2, 7, 9].mapList((item) => item.toDouble());
```

### Comparable

* **min** and **minOrNull**

```dart
final min = [3, 6, 2, 7, 9].min; // 2
// or
final min = [].minOrNull; // null
```

* **max** and **maxOrNull**

```dart
final max = [3, 6, 2, 7, 9].max; // 9
// or
final max = [].maxOrNull; // null
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

### Math

* **sum**

```dart
final sum = [3, 6, 2, 7, 9].sum; // 27
```

* **average**

```dart
final average = [1, 3, 5, 7, 4, 4].average; // 4
```

### Set

* **distinct**

```dart
final collectionOne = [2, 5, 8, 2];
final collectionTwo = [1, 3, 5, 7];

final distinctCollection = collectionOne.distinct; // [2, 5, 8]
```

* **union**

```dart
final collectionOne = [2, 5, 8, 2];
final collectionTwo = [1, 3, 5, 7];

final unitedCollection = collectionOne.union(collectionTwo); // [2, 5, 8, 1, 3, 7]
```

* **intersection**

```dart
final collectionOne = [2, 5, 8, 2];
final collectionTwo = [1, 3, 5, 7];

final intersectedCollection = collectionOne.intersection(collectionTwo); // [5]
```

* **difference**

```dart
final collectionOne = [2, 5, 8, 2];
final collectionTwo = [1, 3, 5, 7];

final differedCollection = collectionOne.difference(collectionTwo); // [2, 8]
// or
final differedCollection = collectionTwo.difference(collectionOne); // [1, 3, 7]
```

## Milestones for next releases

* Add `notNull` getter
* Add `minWhere` method
* Add `maxWhere` method
* Add `minOrNullWhere` method
* Add `maxOrNullWhere` method
