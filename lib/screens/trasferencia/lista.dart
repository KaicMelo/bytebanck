
import 'package:flutter/material.dart';
import 'package:bytebank/screens/trasferencia/formulario.dart';
import 'package:bytebank/models/trasferencia.dart';

const _tituloAppBar = 'Transferências';

class ListaTransferencia extends StatefulWidget 
{
  final List<Transferencia> transferencias = List();

  @override
  State<StatefulWidget> createState()
  {
    return ListaTrasferenciasState();
  } 
}

class ListaTrasferenciasState extends State<ListaTransferencia>
{
  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ), 
      body:ListView.builder( 
        itemCount: widget.transferencias.length,
        itemBuilder: (context,indice){
          final transfere = widget.transferencias[indice];
          return ItemTransferencia(transfere);
        },
      ),
    floatingActionButton: FloatingActionButton(
      onPressed: ()
      {
        Navigator.push(context,MaterialPageRoute(builder: (context) {
          return FormularioTransferencia();
        })).then((TransferenciaRecebida) {
          //REALIZANDO A ATUALIZAÇÃO
            if(TransferenciaRecebida != null)
            {
              setState(() {
                widget.transferencias.add(TransferenciaRecebida);
              });
            }
          });
      },
      child: Icon(Icons.add),
    ),

     );
  }
}

class ItemTransferencia extends StatelessWidget
{

  final Transferencia _Transferencia;
  
  ItemTransferencia(this._Transferencia);

  @override
  Widget build(BuildContext context)
  {
    return  Card(
          child: ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text(_Transferencia.valor.toString()),
            subtitle: Text(_Transferencia.numConta.toString()),
          )
        );
  }
}
