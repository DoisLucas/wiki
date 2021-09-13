import 'package:flutter/material.dart';
import 'package:wiki/models/personagem.dart';
import 'package:wiki/personagem_detalhe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Personagem> personagens = [];

  @override
  void initState() {
    Personagem p1 = Personagem(
        nome: "Android Mk.99", tipo: 'Ataque e Distância', poder: 'Luz', image: 'assets/images/1.png', stars: 3);
    Personagem p2 = Personagem(nome: "F. Princesa", tipo: 'Tank', poder: 'Luz', image: 'assets/images/2.png', stars: 3);
    Personagem p3 =
        Personagem(nome: "Noxia", tipo: 'Suporte', poder: 'Escuridão', image: 'assets/images/3.png', stars: 3);
    Personagem p4 = Personagem(nome: "Garam", tipo: 'Ranged', poder: 'Água', image: 'assets/images/4.png', stars: 3);
    personagens.add(p1);
    personagens.add(p2);
    personagens.add(p3);
    personagens.add(p4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wiki"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 40, top: 20),
        child: Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.horizontal,
            runSpacing: 12,
            spacing: 12,
            children: personagens.map((e) => renderPersonagem(e)).toList(),
          ),
        ),
      ),
    );
  }

  List<Widget> countStars(int quantidade) {
    List<Widget> estrelas = [];

    for (int i = 0; i < quantidade; i++) {
      estrelas.add(
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 15,
        ),
      );
    }
    return estrelas;
  }

  Widget renderPersonagem(Personagem personagem) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PersonagemDetail(personagem: personagem)),
        );
      },
      child: Container(
        width: (MediaQuery.of(context).size.width / 2) - 20,
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              color: Colors.white,
              child: Image.asset(
                personagem.image,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(personagem.nome ?? ''),
                  Text(
                    personagem.tipo ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(personagem.poder ?? ''),
                  Row(
                    children: countStars(personagem.stars).toList(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
