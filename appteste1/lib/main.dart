import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(new AppPergunta());

class _AppPerguntaState extends State<AppPergunta> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Azul', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Vermelho', 'pontuacao': 1}
      ],
    },
    {
      'texto': 'Qual o seu animal favorito?',
      'respostas': [
        {'texto': 'Cachorro', 'pontuacao': 10},
        {'texto': 'Gato', 'pontuacao': 5},
        {'texto': 'Cobra', 'pontuacao': 3},
        {'texto': 'Coelho', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual o seu curso preferido?',
      'respostas': [
        {'texto': 'Informática', 'pontuacao': 10},
        {'texto': 'Artes', 'pontuacao': 5},
        {'texto': 'Medicina', 'pontuacao': 3},
        {'texto': 'Engenharia', 'pontuacao': 1}
      ],
    },
  ];
  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuiz() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quantoResponder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuiz),
      ),
    );
  }
}

class AppPergunta extends StatefulWidget {
  _AppPerguntaState createState() {
    return _AppPerguntaState();
  }
}
