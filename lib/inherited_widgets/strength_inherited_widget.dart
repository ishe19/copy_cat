import 'package:flutter/material.dart';

 class StrengthInheritedWidget extends InheritedWidget{

   final strengths = [
     {
       'strength': 'speed',
       'description':'swift'
     },
     {
       'strength': 'strength',
       'description':'high damage capability'
     },
     {
       'strength': 'agility',
       'description':'flexible and nimble'
     }, 
   ];

   StrengthInheritedWidget(Widget child): super(child: child);

   static StrengthInheritedWidget of(BuildContext context){
     return (context.inheritFromWidgetOfExactType(StrengthInheritedWidget)as StrengthInheritedWidget);
   }
   
  @override
  bool updateShouldNotify(StrengthInheritedWidget oldWidget) {
    return oldWidget.strengths != strengths;
  }
 }