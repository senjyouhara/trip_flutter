import 'package:flutter/material.dart';

class KeepAliveWrapper extends StatefulWidget {
  const KeepAliveWrapper({Key? key,@required this.child,this.keepAlive = true}):super(key: key);

  final Widget? child; //用来包裹需要保持状态的view
  final bool keepAlive; //用于设置是否保持
  @override
  State<KeepAliveWrapper> createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>  with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return widget.child!;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => widget.keepAlive;
}
