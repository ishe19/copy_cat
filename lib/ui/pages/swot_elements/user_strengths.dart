import 'package:copy_cat/inherited_widgets/strength_inherited_widget.dart';
import 'package:copy_cat/ui/pages/swot_elements/elements_page.dart';
import 'package:flutter/material.dart';

class Strengths extends StatefulWidget{
  Strengths({this.title, this.strengths});
  final Widget title, strengths;
 
 @override
  StrengthsState createState() => new StrengthsState();
}

class StrengthsState extends State<Strengths>{

  List<Map<String,String>> get _strengths => StrengthInheritedWidget.of(context).strengths;
  
  @override
  Widget build(BuildContext context){
    return StrengthInheritedWidget(
      Scaffold(
        appBar: new AppBar( 
          title: Text ('Strengths'),
          actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {

            },
          ),]),
        body: ListView.builder(
          itemBuilder:(context, index){ 
          return GestureDetector(
            onTap: (){
 Navigator.push(context, MaterialPageRoute(builder: (context) => Items(AddMode.Editing)));
 },
            child: Card(
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0,bottom: 30.0,left:30.0,right: 22.0),
              child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                  _StrengthTitle(_strengths[index]['title']),
                  Container(height: 4,),
               _StrengthText(_strengths[index]['text']),
              ],
            ),
            ),
          ),
          );
          },
         itemCount: _strengths.length,
        ),      
        floatingActionButton:FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Items(AddMode.Adding)));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
            ),
      ),
    );
  }
}

class _StrengthTitle extends StatelessWidget{
  final String _title;

  _StrengthTitle(this._title);

  @override 
  Widget build(BuildContext context){
    return Text(
      _title,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold
      ),
    );
  }
}

class _StrengthText extends StatelessWidget{
  final String _text;

  _StrengthText(this._text);

  @override 
  Widget build(BuildContext context){
    return Text(
      _text,
      style: TextStyle(
        color:Colors.grey.shade600,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
