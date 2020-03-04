import 'package:copy_cat/providers/threats_providers.dart';
import 'package:flutter/material.dart';


enum NoteMode {
  Editing,
  Adding
}

class Threat extends StatefulWidget {
  final String swotID;

  final NoteMode noteMode;
  final Map<String, dynamic> note;

  Threat(this.noteMode, this.note, this.swotID);

  @override
  ThreatState createState() {
    return new ThreatState();
  }
}

class ThreatState extends State<Threat> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  

  @override
  void didChangeDependencies() {
    if (widget.noteMode == NoteMode.Editing) {
      _titleController.text = widget.note['title'];
      _textController.text = widget.note['text'];
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.noteMode == NoteMode.Adding ? 'Add Threat' : 'Edit Threat'
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Threat title'
              ),
            ),
            Container(height: 8,),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Threat description'
              ),
            ),
            Container(height: 16.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _NoteButton('Save', Colors.blue, () {
                  final title = _titleController.text;
                  final text = _textController.text;

                  if (widget?.noteMode == NoteMode.Adding) {
                    ThreatProvider.insertThreat({
                      'title': title,
                      'text': text,
                      'swotID': widget.swotID
                    });
                  } else if (widget?.noteMode == NoteMode.Editing) {
                    ThreatProvider.updateThreat({
                      'id': widget.note['id'],
                      'title': _titleController.text,
                      'text': _textController.text,
                    });
                  }
                  Navigator.pop(context);
                }),
                Container(height: 16.0,),
                _NoteButton('Discard', Colors.grey, () {
                  Navigator.pop(context);
                }),
                widget.noteMode == NoteMode.Editing ?
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: _NoteButton('Delete', Colors.red, () async {
                      await ThreatProvider.deleteThreat(widget.note['id']);
                      Navigator.pop(context);
                    }),
                  )
                 : Container()
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _NoteButton extends StatelessWidget {

  final String _text;
  final Color _color;
  final Function _onPressed;

  _NoteButton(this._text, this._color, this._onPressed);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: _onPressed,
      child: Text(
        _text,
        style: TextStyle(color: Colors.white),
      ),
      height: 40,
      minWidth: 100,
      color: _color,
    );
  }
}
