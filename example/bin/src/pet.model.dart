// Copyright (c) 2021, the MarchDev Toolkit project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

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
