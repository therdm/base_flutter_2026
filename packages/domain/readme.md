### freezed classes re-generate

```shell
  flutter packages pub run build_runner build --delete-conflicting-outputs && dart format .
```

#### un-freezed alternative

###### Don't use unfreezed and use freezed instead ALWAYES

```dart
unfreezed
```
is equivalent to

```dart
@Freezed(
  equal: false,
  addImplicitFinal: false,
  makeCollectionsUnmodifiable: false,
)
```

#### Properties to use in Freezed

```dart
@Freezed(
  equal: false,
  addImplicitFinal: false,
  makeCollectionsUnmodifiable: false,
  copyWith: false,
  fromJson: false,
  toJson: true,
)
```