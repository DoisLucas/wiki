import 'package:flutter/material.dart';
import 'package:wiki/models/personagem.dart';

class PersonagemDetail extends StatefulWidget {
  const PersonagemDetail({Key? key, required this.personagem}) : super(key: key);

  final Personagem personagem;

  @override
  _PersonagemDetailState createState() => _PersonagemDetailState();
}

class _PersonagemDetailState extends State<PersonagemDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.personagem.nome ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Hero(
              tag: widget.personagem.nome ?? '',
              child: Image.asset(
                widget.personagem.image,
                scale: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
