import 'package:animacao4/expanded_card.dart';
import 'package:flutter/material.dart';

class MyScreen extends StatelessWidget {

   MyScreen({ super.key });

  String title1 = 'Meditação 1';
  String text1 =
      'E, se Cristo não ressuscitou, logo é vã a nossa pregação, e também é vã a vossa fé. 1Co 15.14';
  String title2 = 'Meditação 2';
  String text2 =
      ' E, suspirando profundamente em seu espírito, disse: Por que pede esta geração um sinal? Em verdade vos digo que a esta geração não se dará sinal algum. Mc 8.12';
  String title3 = 'Meditação 3';
  String text3 =
      ' E aquele que não foi achado escrito no livro da vida foi lançado no lago de fogo. Ap 20.15';
  String title4 = 'Meditação 4';
  String text4 =
      'Se alguém diz: Eu amo a Deus, e odeia a seu irmão, é mentiroso. Pois quem não ama a seu irmão, ao qual viu, como pode amar a Deus, a quem não viu? 1Jo 4.20';
  String title5 = 'Meditação 5';
  String text5 = ' No princípio criou Deus o céu e a terra. Gn 1.1';


   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Exercício de animação controlada 2'),),
           body: SingleChildScrollView(
            child: Column(
              children: [
                ExpandedCard(isOpen: false, title: title1, text: text1),
                ExpandedCard(isOpen: false, title: title2, text: text2),
                ExpandedCard(isOpen: false, title: title3, text: text3),
                ExpandedCard(isOpen: false, title: title4, text: text4),
                ExpandedCard(isOpen: false, title: title5, text: text5),
              ],
            ),
           ),
       );
  }
}
