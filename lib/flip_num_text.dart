import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'clip_rect_text.dart';
import 'flip_model.dart';

GlobalKey<_FlipNumTextState> childKey = GlobalKey();

class FlipNumText extends StatefulWidget {
  const FlipNumText({Key? key}) : super(key: key);

  @override
  _FlipNumTextState createState() {
    return _FlipNumTextState();
  }
}

class _FlipNumTextState extends State<FlipNumText>
    with SingleTickerProviderStateMixin {
  late Animation _animation;
  bool _isReversePhase = false;
  int _stateNum = 0;
  final double _zeroAngle = 0;
  late AnimationController _controller;

  void clean() {
    setState(() {
      _stateNum = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 450), vsync: this)
      ..addStatusListener((status) {
        //动画正向执行,正向执行结束后进行反向执行
        if (status == AnimationStatus.completed) {
          debugPrint('completed $_isReversePhase  ');
          _isReversePhase = !_isReversePhase;
          _controller.reverse();
          debugPrint('completed $_isReversePhase  ');
        }
        //动画反向执行，反向执行结束后一次动画翻转周期结束。当前数字更新到最新的
        if (status == AnimationStatus.dismissed) {
          debugPrint('dismissed $_isReversePhase  ');
          if (_isReversePhase) {
            _stateNum += 1;
          } else {
            if (_stateNum > 0) {
              _stateNum -= 1;
            }
          }
          _isReversePhase = !_isReversePhase;
          debugPrint('dismissed $_isReversePhase  ');
        }
      })
      ..addListener(() {
        setState(() {});
      });
    //动画数值使用0度角到90度角
    _animation = Tween(begin: _zeroAngle, end: pi / 2).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // // TODO: implement build
    return Consumer<CounterModel>(
        builder: (context, counter, _) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                    child: Stack(
                      children: <Widget>[
                        //下一个数字的上部分
                        ClipRectText(
                          value: counter.clean ? _stateNum = 0 : _stateNum + 1,
                          alignment: Alignment.topCenter,
                        ),
                        //当前数字的上部分，当_isReversePhase为true时和平面呈90度角相当于隐藏
                        Transform(
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.001)
                              ..rotateX(
                                  _isReversePhase ? pi / 2 : _animation.value),
                            alignment: Alignment.bottomCenter,
                            child: ClipRectText(
                              value: counter.clean ? _stateNum = 0 : _stateNum,
                              alignment: Alignment.topCenter,
                            )),
                      ],
                    ),
                    onTap: () {
                      if (counter.clean) {
                        counter.clean = false;
                      }
                      if (_stateNum >= 0) {
                        _isReversePhase = true;
                        _controller.forward();
                        debugPrint('                 ');
                      }
                    }),
                const Padding(
                  padding: EdgeInsets.only(top: 5.0),
                ),
                GestureDetector(
                    child: Stack(
                      children: <Widget>[
                        //当前数字的下部分
                        ClipRectText(
                          value: counter.clean ? _stateNum = 0 : _stateNum,
                          alignment: Alignment.bottomCenter,
                        ),
                        //下个数字的下部分，当_isReversePhase为true时才执行翻转动画否则一直和平面呈90度
                        Transform(
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.001)
                              ..rotateX(
                                  _isReversePhase ? -_animation.value : pi / 2),
                            alignment: Alignment.topCenter,
                            child: ClipRectText(
                              value:
                                  counter.clean ? _stateNum = 0 : _stateNum + 1,
                              alignment: Alignment.bottomCenter,
                            )),
                      ],
                    ),
                    onTap: () {
                      if (counter.clean) {
                        counter.clean = false;
                      }
                      _isReversePhase = false;
                      _controller.forward();
                    })
              ],
            ));
  }
}
