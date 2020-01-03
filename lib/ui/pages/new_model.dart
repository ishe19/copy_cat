import 'package:copy_cat/ui/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:copy_cat/ui/utils/uidata.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:async';


final formkey = new GlobalKey<FormState> ();

class NewModel extends StatefulWidget {

  var cameras;
  NewModel(this.cameras);


  @override
  _NewModelState createState() => _NewModelState();
}

class _NewModelState extends State<NewModel> {



  TextEditingController _titleController;
  Color labelColor = Colors.grey;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard(widget.cameras)));
          },
        ),
        title: Text("New Model"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {

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
                        controller: _titleController,
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
                        controller: _titleController,
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
                        controller: _titleController,
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
                        controller: _titleController,
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
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CameraScreen(widget.cameras)));
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


class CameraScreen extends StatefulWidget {

  List<CameraDescription> cameras;

  CameraScreen(this.cameras);



  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  CameraController controller;
  Future<void> _initializeControllerFuture;


  void initState(){
    super.initState();
    controller = new CameraController(widget.cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_){
      if(!mounted){
        return;
      }
      setState(() {

      });
    });
  }

  @override
  void dispose(){
    controller?.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera_alt, color: Colors.black,),
          // Provide an onPressed callback.
          onPressed: () async {
            // Take the Picture in a try / catch block. If anything goes wrong,
            // catch the error.
            try {
              // Ensure that the camera is initialized.
              await _initializeControllerFuture;

              // Construct the path where the image should be saved using the path
              // package.
              final path = join(
                // Store the picture in the temp directory.
                // Find the temp directory using the `path_provider` plugin.
                (await getTemporaryDirectory()).path,
                '${DateTime.now()}.png',
              );

              // Attempt to take a picture and log where it's been saved.
              await controller.takePicture(path);
            } catch (e) {
              // If an error occurs, log the error to the console.
              print(e);
            }
          },
        ),
        body: Container(
        child: AspectRatio(
        aspectRatio: controller.value.aspectRatio ,
        child: CameraPreview(controller),
    )
        )
    );

  }
}

class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  // Add two variables to the state class to store the CameraController and
  // the Future.
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Fill this out in the next steps.
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt, color: Colors.black,),
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Construct the path where the image should be saved using the path
            // package.
            final path = join(
              // Store the picture in the temp directory.
              // Find the temp directory using the `path_provider` plugin.
              (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );

            // Attempt to take a picture and log where it's been saved.
            await _controller.takePicture(path);
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
      ),

      body: Container(

      child: AspectRatio(
      aspectRatio: _controller.value.aspectRatio ,
        child: CameraPreview(_controller),
      )

      ),
    );
  }
}