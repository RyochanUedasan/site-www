// ignore_for_file: argument_type_not_assignable
// #docplaster
import 'package:examples/language_tour/generics/base_class.dart';
import 'package:test/test.dart';

final Matcher throwsATypeError = throwsA(new isInstanceOf<TypeError>());

void main() {
  test('constructor-1', () {
    // #docregion constructor-1
    var names = new List<String>();
    names.addAll(['Seth', 'Kathy', 'Lars']);
    var nameSet = new Set<String>.from(names);
    // #enddocregion constructor-1
    expect(nameSet.length, 3);
  });

  test('constructor-2', () {
    // #docregion constructor-2
    var views = new Map<int, View>();
    // #enddocregion constructor-2
    expect(views.length, 0);
  });

  test('generic-collections', () {
    _test() {
      // #docregion generic-collections
      var names = new List<String>();
      names.addAll(['Seth', 'Kathy', 'Lars']);
      print(names is List<String>); // true
      // #enddocregion generic-collections
    }

    expect(_test, prints('true\n'));
  });

  test('method', () {
    // #docregion method, method-with-main
    T first<T>(List<T> ts) {
      // Do some initial work or error checking, then...
      T tmp = ts[0];
      // Do some additional checking or processing...
      return tmp;
    }
    // #enddocregion method

    void main() => print('first: ${first<int>([1,2,3])}');
    // #enddocregion method-with-main
    expect(main, prints('first: 1\n'));
  });

  test('base_class', () {
    // #docregion SomeBaseClass-ok
    var someBaseClassFoo = new Foo<SomeBaseClass>();
    var extenderFoo = new Foo<Extender>();
    // #enddocregion SomeBaseClass-ok
    expect(someBaseClassFoo.toString(), "Instance of 'Foo<SomeBaseClass>'");
    expect(extenderFoo.toString(), "Instance of 'Foo<Extender>'");

    // #docregion no-generic-arg-ok
    var foo = new Foo();
    expect(foo.toString(), "Instance of 'Foo<SomeBaseClass>'");
    // #enddocregion no-generic-arg-ok
  });
}

class View {}
