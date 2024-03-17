import 'package:flutter/material.dart';

class MyObject {
  int _value;

  MyObject(this._value);//Sử dụng _myObject thay vì _value để theo dõi giá trị.

  // Phương thức tăng giá trị lên 1.
  void increase() {
    _value++;
  }

  // Phương thức giảm giá trị xuống 1.
  void decrease() {
    _value--;
  }

  // Phương thức trả về giá trị hiện tại.
  int get value => _value;

  // Phương thức đặt giá trị mới.
  set value(int newValue) {
    _value = newValue;
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String title = 'Tính Toán';
  MyObject _myObject = MyObject(0);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.person),
            title: Text(title ?? 'Debugging App'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildText(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildButton('Tăng', () {
                      _myObject.increase();
                      setState(() {});
                    }),
                    SizedBox(width: 16),
                    _buildButton('Giảm', () {
                      _myObject.decrease();
                      setState(() {});
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildText() {
    return Text(
      'Giá trị hiện tại: ${_myObject.value}',
      style: TextStyle(fontSize: 24),
    );
  }

  Widget _buildButton(String label, VoidCallback onPressed) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}

void main() {
  runApp(const MyApp());
}
