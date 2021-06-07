import 'package:flutter/material.dart';

class PopUpMenu extends StatefulWidget {
  const PopUpMenu({Key key}) : super(key: key);

  @override
  _PopUpMenuState createState() => _PopUpMenuState();
}
enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class _PopUpMenuState extends State<PopUpMenu> {
  dynamic _selection = WhyFarther.harder;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pop Up Menu'),leading: PopupMenuButton<WhyFarther>(
        onSelected: (WhyFarther result) { setState(() { _selection = result; }); },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
          const PopupMenuItem<WhyFarther>(
            value: WhyFarther.harder,
            child: Text('Working a lot harder'),
          ),
          const PopupMenuItem<WhyFarther>(
            value: WhyFarther.smarter,
            child: Text('Being a lot smarter'),
          ),
          const PopupMenuItem<WhyFarther>(
            value: WhyFarther.selfStarter,
            child: Text('Being a self-starter'),
          ),
          const PopupMenuItem<WhyFarther>(
            value: WhyFarther.tradingCharter,
            child: Text('Placed in charge of trading charter'),
          ),
        ],
      ),),
      body: Center(
        child: Text(_selection.toString()),
      ),
    );
  }
}
