class Phone {
  String _brand = '';   // Bug 1: fields need a starting value
  int _battery = 0;

  Phone(String brand, int battery) {
    _brand = brand;
    _battery = battery;
  }

  String get brand {
    return _brand;
  }

  int get battery {
    return _battery;
  }

  // Bug 4: added setter, accepts only 0 to 100
  set battery(int value) {
    if (value >= 0 && value <= 100) {
      _battery = value;
    }
  }
}

class SmartPhone extends Phone {
  String _system = '';

  // Bug 2: must call the parent constructor with super
  SmartPhone(String brand, int battery, String system) : super(brand, battery) {
    _system = system;
  }

  // Bug 3: removed @override, because Phone has no restart()
  void restart() {
    print('Restarting $_system');
  }
}

void main() {
  Phone p = new Phone('Tecno', 50); // NOT a bug: "new" is optional but still valid
  p.battery = 100;
  print(p.battery); // Bug 5: battery is a getter, so no ()
}
