import 'package:flutter/material.dart';
import 'dart:async';

class LoadingDialog extends StatelessWidget {
    
    String text;
    
    LoadingDialog({Key key, @required this.text}) : super(key: key);
    
    static show(context, {delay: 10, message: "加载中", barrierDismissible: true}) {
        LoadingTicker loadingTicker = LoadingTicker();
        
        Timer timer = Timer(Duration(milliseconds: delay), () {
            if (loadingTicker.cancel) {
                return null;
            }
            showDialog(context: context,
                barrierDismissible: barrierDismissible,
                builder: (context) {
                    LoadingDialog ld = LoadingDialog(text: message);
                    loadingTicker.loadingDialog = ld;
                    return ld;
                });
        });
        loadingTicker.timer = timer;
        return loadingTicker;
    }
    
    static hide(BuildContext context, LoadingTicker loadingTicker, {cb}) {
        loadingTicker.cancel = true;
        Timer(Duration(milliseconds: 150), () {
//            if(loadingTicker.timer.isActive) {
            loadingTicker.timer.cancel();
            loadingTicker.timer = null;
//            }
            if (loadingTicker.loadingDialog != null) {
                loadingTicker.loadingDialog._dismiss(context);
            }
            if (cb != null) {
                cb();
            }
        });
    }
    
    _dismiss(context) {
        Navigator.pop(context);
    }
    
    @override
    Widget build(BuildContext context) {
        return new Material(
            type: MaterialType.transparency,
            child: new Center(
                child: new SizedBox(
                    width: 120.0,
                    height: 120.0,
                    child: new Container(
                        decoration: ShapeDecoration(
                            color: Color(0xffffffff),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                ),
                            ),
                        ),
                        child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                                new CircularProgressIndicator(),
                                new Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20.0,
                                    ),
                                    child: new Text(
                                        text,
                                        style: new TextStyle(fontSize: 12.0),
                                    ),
                                ),
                            ],
                        ),
                    ),
                ),
            ),
        );
    }
}

class LoadingTicker {
    
    Timer timer;
    LoadingDialog loadingDialog;
    bool cancel = false;
}