import 'package:flutter/material.dart';

void main() {
  runApp(const CalculadoraApp());
}

class CalculadoraApp extends StatefulWidget {
  const CalculadoraApp({super.key});

  @override
  State<CalculadoraApp> createState() => _CalculadoraAppState();
}

class _CalculadoraAppState extends State<CalculadoraApp> {
  // Controllers para capturar os números digitados
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  // Variável de estado para guardar o texto do resultado
  String _resultado = 'Resultado: ';

  // Funções para cada operação básica
  void _somar() {
    double n1 = double.tryParse(_num1Controller.text) ?? 0.0;
    double n2 = double.tryParse(_num2Controller.text) ?? 0.0;
    setState(() {
      _resultado = 'Resultado: ${n1 + n2}';
    });
  }

  void _subtrair() {
    double n1 = double.tryParse(_num1Controller.text) ?? 0.0;
    double n2 = double.tryParse(_num2Controller.text) ?? 0.0;
    setState(() {
      _resultado = 'Resultado: ${n1 - n2}';
    });
  }

  void _multiplicar() {
    double n1 = double.tryParse(_num1Controller.text) ?? 0.0;
    double n2 = double.tryParse(_num2Controller.text) ?? 0.0;
    setState(() {
      _resultado = 'Resultado: ${n1 * n2}';
    });
  }

  void _dividir() {
    double n1 = double.tryParse(_num1Controller.text) ?? 0.0;
    double n2 = double.tryParse(_num2Controller.text) ?? 0.0;
    setState(() {
      if (n2 == 0) {
        _resultado = 'Resultado: Não é possível dividir por 0';
      } else {
        _resultado = 'Resultado: ${n1 / n2}';
      }
    });
  }

  @override
  void dispose() {
    _num1Controller.dispose();
    _num2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora Simples'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Campo para o Número 1
              TextField(
                controller: _num1Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Número 1',
                ),
              ),

              const SizedBox(height: 16),

              // Campo para o Número 2
              TextField(
                controller: _num2Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Número 2',
                ),
              ),

              const SizedBox(height: 20),

              // Linha com os 4 botões de operação
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _somar,
                    child: const Text('+'),
                  ),
                  ElevatedButton(
                    onPressed: _subtrair,
                    child: const Text('-'),
                  ),
                  ElevatedButton(
                    onPressed: _multiplicar,
                    child: const Text('*'),
                  ),
                  ElevatedButton(
                    onPressed: _dividir,
                    child: const Text('/'),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Exibição do resultado
              Text(
                _resultado,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
