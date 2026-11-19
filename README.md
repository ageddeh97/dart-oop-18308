# Dart OOP Assignment: Kigali Bus Card

**Name:** Aloysius Geddeh

**Student ID:** 18308

## My numbers

- D = 8, L = 8
- Starting balance = 1000 + (8 x 10) = 1080 RWF
- Bus fare = 200 + 8 = 208 RWF
- Student discount = 10 + 8 = 18%

## Output of main.dart

(Replace this with the real output after running `dart run main.dart`.)

```text
Error: name too short
Owner: Aloysius | Balance: 1080 RWF
Owner: Aloysius Geddeh | Balance: 1080 RWF
Error: top-up must be 500 to 50000 RWF
Topped up 2000 RWF
Paid 208 RWF
Paid 208 RWF
Owner: Aloysius Geddeh | Balance: 2664 RWF
Student discount: 37 RWF
Paid 171 RWF
Owner: Aloysius Geddeh | Balance: 909 RWF
Student card: 18% off
```

## Part 1: Why no setter for balance?

A setter would let any code write `card.balance = 999999`, skipping the rules. Without it, the balance can only change through `topUp` (500 to 50000 RWF) and `pay` (cannot go below 0), so the card's money stays trustworthy.

## Part 2: What does ~/ do?

`/` gives a decimal result, and `~/` gives the whole-number part only (it drops the decimals).

```dart
print(237 * 17 / 100);   // prints 40.29
print(237 * 17 ~/ 100);  // prints 40
```

We need `~/` because `off` is an `int`.

## Part 4: Bug table

| Bug | The line | Why it is wrong (your words) | Your fix |
|---|---|---|---|
| 1 | `String _brand;` / `int _battery;` | The fields have no starting value, and Dart does not allow that for non-nullable types. | `String _brand = '';` and `int _battery = 0;` |
| 2 | `SmartPhone(String brand, int battery, String system) {` | The child constructor does not build the parent Phone first. | Add `: super(brand, battery)` |
| 3 | `@override void restart()` | `@override` needs the parent to have that method, and Phone has no `restart()`. | Remove `@override` |
| 4 | `p.battery = 100;` | There is only a getter, so you cannot assign to `battery`. | Add `set battery(int value)` that accepts 0 to 100 |
| 5 | `print(p.battery());` | `battery` is a getter (a property), so it is not called with `()`. | `print(p.battery);` |
| Not a bug | `Phone p = new Phone('Tecno', 50);` | `new` is old style, but it is optional and still valid Dart. | (none) |

## Part 5

My prediction: first `1`, then `5`.

- `a`: add() makes items 1. Setting -5 is refused (value >= 0 fails). Prints 1.
- `b`: BigBag.add() calls super.add() twice, so each add() is +2. Two calls give 4. Then items = 4 + 1 = 5. Prints 5.

Real output: (1
5)

Was I right? (Yes I was right,  Two calls give 4. Then items = 4 + 1 = 5. Prints 5.
)
