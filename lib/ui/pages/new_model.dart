 import 'package:copy_cat/ui/dashboard.dart';
import 'package:copy_cat/ui/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:copy_cat/ui/utils/uidata.dart';
import 'package:copy_cat/models/db_manager.dart';
// import 'package:camera/camera.dart';



enum NoteMode { 
  Editing,
  Adding
}



final formkey = new GlobalKey<FormState> ();

class NewModel extends StatefulWidget {

  final Map<String, dynamic> note;
  final NoteMode noteMode;

  // final cameras;
  NewModel(this.note, this.noteMode);


  @override
  _NewModelState createState() => _NewModelState();
}

class _NewModelState extends State<NewModel> {

  String modelTitle;
  String modelDescription;
  String modelFor, modelBy;

  final form = formkey.currentState;


  TextEditingController _modelTitleController = new TextEditingController();
  TextEditingController _modelDescriptionController = new TextEditingController();
  TextEditingController _modelForController = new TextEditingController();
  TextEditingController _modelByController = new TextEditingController();
  Color labelColor = Colors.grey;
  
  


  @override
  void initState(){
    super.initState();
    _modelDescriptionController.addListener(
      (){
        setState(() {
          modelDescription = _modelDescriptionController.text;
        });
      }
    );
    _modelTitleController.addListener(
      (){
        setState(() {
          modelTitle = _modelTitleController.text;
        });
      }
    );

    _modelByController.addListener((){
        setState(() {
          modelBy = _modelTitleController.text;
        });
      }
    );

    _modelForController.addListener((){
      setState(() {
        modelFor = _modelForController.text;
      });
    });
  }

  bool validateForm() {
    if(formkey.currentState.validate()){
      formkey.currentState.save();
      return true;

    }else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: (){
            Navigator.pop(context);
            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LandingPage()));
          },
        ),
        title: Text("New Canvas"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              if(validateForm()) {
                      if (widget.noteMode == NoteMode.Adding) {
                        DBManagerModel.insertModel({
                          'ModelTitle': modelTitle,
                          'ModelDescription': modelDescription,
                          'For': modelFor,
                          'By': modelBy
                        });
                      } else if (widget?.noteMode == NoteMode.Editing) {
                        DBManagerModel.updateModel({
                          'id': widget.note['id'],
                          'ModelTitle': _modelTitleController.text,
                          'ModelDescription': _modelDescriptionController.text,
                          'For': modelFor,
                          'By': modelBy
                        });
                    }
                    print("$modelTitle, $modelDescription, $modelFor, $modelBy");
                  Navigator.pop(context);
                  }
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: formkey,
            child: Theme(
              data: ThemeData(
                brightness: Brightness.dark,
                indicatorColor: Colors.green,
                inputDecorationTheme: InputDecorationTheme(
                  labelStyle: TextStyle(
                    color: Uidata.primaryColor, fontSize: 20.0
                  )
                )
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Theme(
                      data: ThemeData(
                        primaryColor: Colors.black,
                        indicatorColor: Colors.black,
                        primaryColorDark: Uidata.primaryColor,
                      ),
                      child: TextFormField(
                        onTap: (){

                        },
                        controller: _modelTitleController,
                        onSaved: (value) => modelTitle = value,
                        validator: (val) =>  val.length == 0? "Please enter title" : null,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: labelColor),
                          labelText: "Title",
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                    ),
                    Theme(
                      data: ThemeData(
                        primaryColor: Colors.black,
                        primaryColorDark: Uidata.primaryColor,
                      ),
                      child: TextFormField(
                        controller: _modelDescriptionController,
                        onSaved: (value) => modelDescription = value,
                        validator: (val) =>  val.length == 0? "Please enter description" : null,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: labelColor),
                          labelText: "Description",
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                    ),
                    Theme(
                      data: ThemeData(
                        primaryColor: Colors.black,
                        primaryColorDark: Uidata.primaryColor,
                      ),
                      child: TextFormField(
                        controller: _modelForController,
                        onSaved: (value) => modelFor = value,
                        validator: (val) =>  val.length == 0? "Please enter title" : null,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: labelColor),
                          labelText: "For",
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                    ),
                    Theme(
                      data: ThemeData(
                        primaryColor: Colors.black,
                        primaryColorDark: Uidata.primaryColor,
                      ),
                      child: TextFormField(
                        controller: _modelByController,
                        onSaved: (value) => modelBy = value,
                        validator: (val) =>  val.length == 0? "Please enter title" : null,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: labelColor),
                          labelText: "By",
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: FlatButton(
                              splashColor: Color.fromRGBO(211, 211, 211, 0.8),
                              onPressed: (){
                              },
                              child: Icon(Icons.folder_open, color: Colors.grey, size: 50.0,),
                            ),
                          ),
                          Expanded(
                            child: FlatButton(
                                color: Colors.white,
                              splashColor: Color.fromRGBO(211, 211, 211, 0.8),
                                child: Icon(Icons.camera_alt, color: Colors.grey, size: 50.0,),
                                onPressed: (){
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => CameraScreen()));
                                },
                              ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


}


// class CameraScreen extends StatefulWidget {

//   // final List<CameraDescription> cameras;

//   //  CameraScreen(this.cameras);



//   @override
//   _CameraScreenState createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {

//   // CameraController controller;
//   Future<void> _initializeControllerFuture;


//   void initState(){
//     super.initState();
//     // controller = new CameraController(widget.cameras[0], ResolutionPreset.medium);
//     controller.initialize().then((_){
//       if(!mounted){
//         return;
//       }
//       setState(() {

//       });
//     });
//   }

//   @override
//   void dispose(){
//     controller?.dispose();
//     super.dispose();
//   }

  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.camera_alt, color: Colors.black,),
//           // Provide an onPressed callback.
//           onPressed: () async {
//             // Take the Picture in a try / catch block. If anything goes wrong,
//             // catch the error.
//             try {
//               // Ensure that the camera is initialized.
//               await _initializeControllerFuture;

//               // Construct the path where the image should be saved using the path
//               // package.
//               final path = join(
//                 // Store the picture in the temp directory.
//                 // Find the temp directory using the `path_provider` plugin.
//                 (await getTemporaryDirectory()).path,
//                 '${DateTime.now()}.png',
//               );

//               // Attempt to take a picture and log where it's been saved.
//               await controller.takePicture(path);
//             } catch (e) {
//               // If an error occurs, log the error to the console.
//               print(e);
//             }
//           },
//         ),
//         body: Container(
//         child: AspectRatio(
//         aspectRatio: controller.value.aspectRatio ,
//         child: CameraPreview(controller),
//     )
//         )
//     );

//   }
// }

// class TakePictureScreen extends StatefulWidget {
//   final CameraDescription camera;

//   const TakePictureScreen({
//     Key key,
//     @required this.camera,
//   }) : super(key: key);

//   @override
//   TakePictureScreenState createState() => TakePictureScreenState();
// }

// class TakePictureScreenState extends State<TakePictureScreen> {
//   // Add two variables to the state class to store the CameraController and
//   // the Future.
//   CameraController _controller;
//   Future<void> _initializeControllerFuture;

//   @override
//   void initState() {
//     super.initState();
//     // To display the current output from the camera,
//     // create a CameraController.
//     _controller = CameraController(
//       // Get a specific camera from the list of available cameras.
//       widget.camera,
//       // Define the resolution to use.
//       ResolutionPreset.medium,
//     );

//     // Next, initialize the controller. This returns a Future.
//     _initializeControllerFuture = _controller.initialize();
//   }

//   @override
//   void dispose() {
//     // Dispose of the controller when the widget is disposed.
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Fill this out in the next steps.
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.camera_alt, color: Colors.black,),
//         // Provide an onPressed callback.
//         onPressed: () async {
//           // Take the Picture in a try / catch block. If anything goes wrong,
//           // catch the error.
//           try {
//             // Ensure that the camera is initialized.
//             await _initializeControllerFuture;

//             // Construct the path where the image should be saved using the path
//             // package.
//             final path = join(
//               // Store the picture in the temp directory.
//               // Find the temp directory using the `path_provider` plugin.
//               (await getTemporaryDirectory()).path,
//               '${DateTime.now()}.png',
//             );

//             // Attempt to take a picture and log where it's been saved.
//             await _controller.takePicture(path);
//           } catch (e) {
//             // If an error occurs, log the error to the console.
//             print(e);
//           }
//         },
//       ),

//       body: Container(

//       child: AspectRatio(
//       aspectRatio: _controller.value.aspectRatio ,
//         child: CameraPreview(_controller),
//       )

//       ),
//     );
//   }
// }