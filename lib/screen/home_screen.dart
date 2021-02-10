import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:twiliozoomlib/bloc/twilio/twilio_cubit.dart';
import 'package:twiliozoomlib/bloc/zoom/zoom_cubit.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(listeners: [
        BlocListener<ZoomCubit, ZoomState>(
          cubit: GetIt.I.get<ZoomCubit>(),
          listener: (context, state) {
            switch (state.runtimeType) {
              case ZoomInitial:
                return homeWidget(context);
                break;
              case ZoomInitiated:
                return homeWidget(context);
                break;
              case ZoomConnected:
                showAlertDialog(context, (state as ZoomConnected).message);
                break;
              case ZoomConnectFailed:
                showAlertDialog(context, (state as ZoomConnectFailed).message);

                break;

              default:
                return homeWidget(context);
            }
          },
        ),
        BlocListener<TwilioCubit, TwilioState>(
          cubit: GetIt.I.get<TwilioCubit>(),
          listener: (context, state) {
            switch (state.runtimeType) {
              case TwilioInitial:
                return homeWidget(context);
                break;
              case TwilioInitiated:
                return homeWidget(context);
                break;
              case TwilioConnected:
                showAlertDialog(context, (state as TwilioConnected).message);
                break;
              case TwilioConnectFailed:
                showAlertDialog(
                    context, (state as TwilioConnectFailed).message);

                break;

              default:
                return homeWidget(context);
            }
          },
        ),
      ], child: homeWidget(context)),
    );
  }

  Widget homeWidget(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Package Sample'),
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ignore: deprecated_member_use
                  RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45.0),
                          side: BorderSide(color: Colors.red)),
                      onPressed: () {
                        TwilioCubit twilioCubit = GetIt.I.get<TwilioCubit>();
                        twilioCubit.connectTwilio();
                      },
                      color: Colors.red[400],
                      child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "Connect Twillio",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ))),
                  // ignore: deprecated_member_use
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(45.0),
                            side: BorderSide(color: Colors.blue)),
                        onPressed: () {
                          ZoomCubit zoomCubit = GetIt.I.get<ZoomCubit>();
                          zoomCubit.connectZoom();
                        },
                        color: Colors.blue[400],
                        child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              "Connect Zoom",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ))),
                  )
                ],
              ),
            )),
      ),
    );
  }

  showAlertDialog(BuildContext context, String message) {
    // set up the button
    // ignore: deprecated_member_use
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
