 
import 'package:flutter/material.dart';
import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/trasferencia.dart';

const _tituloAppBar = 'Criando Transferências';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '00.0';
const _rotuloCampoNumeroConta = "Numero da conta";
const _dicaCampoNumeroConta = "0000";
const _textoBotaoConfirmar = "Confirmar";

 class FormularioTransferencia extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()
  {
    return FormularioTransferenciaState();
  }

}

class FormularioTransferenciaState extends State<FormularioTransferencia>
{
  final TextEditingController controladorCampoNumeroConta = TextEditingController();
  final TextEditingController controladorCampoValor = TextEditingController();


  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      appBar: AppBar(
      title: const Text(_tituloAppBar),
      ),
      body:SingleChildScrollView(
        child:Column(
        children: <Widget>[
          Editor(controlador: controladorCampoNumeroConta,rotulo: _rotuloCampoNumeroConta ,dica: _dicaCampoNumeroConta), 
          Editor(controlador: controladorCampoValor, rotulo: _rotuloCampoValor, dica: _dicaCampoValor, icone: Icons.monetization_on), 
        RaisedButton(
          child: Text(_textoBotaoConfirmar),
          onPressed: () {
            criaTrasferencia(context,controladorCampoNumeroConta.text,controladorCampoValor.text);
          },
        ),
        ]
      ), 
      ),
    );
  }
}

void criaTrasferencia(context,criaNumConta,criaValor)
{
  final int numConta = int.tryParse(criaNumConta);
  final double valor = double.tryParse(criaValor); 

  if(numConta !=null && valor != null)
  {
    final trasferenciaCriada = Transferencia(valor,numConta); 
    // debugPrint("$trasferenciaCriada");
    Navigator.pop(context, trasferenciaCriada);

  }
}
