import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
        hintColor: Colors.tealAccent,
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          buttonColor: Colors.grey[850],
          textTheme: ButtonTextTheme.accent,
        ),
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _expression = '';
  String _result = '';

  void _onPress(String text) {
    setState(() {
      _expression += text;
    });
  }

  void _onClear() {
    setState(() {
      _expression = '';
      _result = '';
    });
  }

  void _onDelete() {
    setState(() {
      if (_expression.isNotEmpty) {
        _expression = _expression.substring(0, _expression.length - 1);
      }
    });
  }

  void _onEquals() {
    setState(() {
      try {
        _result = '${eval(_expression)}';
      } catch (e) {
        _result = 'Error';
      }
    });
  }

  dynamic eval(String expression) {
    try {
      final evaluator = const ExpressionEvaluator();
      final exp = Expression.parse(expression);
      final result = evaluator.eval(exp, {});
      return result;
    } catch (e) {
      return 'Error';
    }
  }

  Widget buildButton(String text, {Color? color, Color? textColor}) {
    return ElevatedButton(
      onPressed: () => _onPress(text),
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor ?? Theme.of(context).buttonTheme.colorScheme?.onPrimary, backgroundColor: color ?? Theme.of(context).buttonTheme.colorScheme?.primary,
        minimumSize: Size(70, 70),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  Widget buildControlButton(String text, VoidCallback onPressed, {Color? color, Color? textColor}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor ?? Theme.of(context).buttonTheme.colorScheme?.onPrimary, backgroundColor: color ?? Theme.of(context).buttonTheme.colorScheme?.primary,
        minimumSize: Size(70, 70),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator by Ravindra'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        _expression,
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                    Text(
                      _result,
                      style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return GridView.count(
                    crossAxisCount: constraints.maxWidth > 600 ? 6 : 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: constraints.maxWidth > 600 ? 1.5 : 1,
                    children: [
                      buildControlButton('C', _onClear, color: Colors.red),
                      buildControlButton('<-', _onDelete, color: Colors.blue),
                      buildButton('%'),
                      buildButton('/'),
                      if (constraints.maxWidth > 600) ...[
                        buildButton(''),
                        buildButton(''),
                      ],
                      buildButton('7'),
                      buildButton('8'),
                      buildButton('9'),
                      buildButton('*'),
                      if (constraints.maxWidth > 600) ...[
                        buildButton(''),
                        buildButton(''),
                      ],
                      buildButton('4'),
                      buildButton('5'),
                      buildButton('6'),
                      buildButton('-'),
                      if (constraints.maxWidth > 600) ...[
                        buildButton(''),
                        buildButton(''),
                      ],
                      buildButton('1'),
                      buildButton('2'),
                      buildButton('3'),
                      buildButton('+'),
                      if (constraints.maxWidth > 600) ...[
                        buildButton(''),
                        buildButton(''),
                      ],
                      buildButton('0', color: Colors.grey[700]),
                      buildButton('.'),
                      buildControlButton('=', _onEquals, color: Colors.teal),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
