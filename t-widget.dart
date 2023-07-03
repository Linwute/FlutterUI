import 'package:flutter/material.dart';
/* 
  【Flutter Div小组件】 2023-07-03  开发者: Linwute  开发者E-Mail: Linwute@tom.com
    
 单选框按钮】 Radios(arrName: ["标题1", "标题2", "标题3"],onChanged:(res) => print(res)),

*/

//单选框
class Radios extends StatefulWidget {
  int index; //默认选择
  double size; //字体与图标大小
  Color color; //选择框颜色
  Color fontColor; //文字颜色
  List<String> arrName = []; //列表数组
  Function onChanged; //回调
  Radios({
    super.key,
    this.index = 0,
    this.size = 0,
    this.color = Colors.blue,
    this.fontColor = Colors.black,
    required this.arrName,
    required this.onChanged,
  });

  @override
  State<Radios> createState() => _RadiosState();
}

class _RadiosState extends State<Radios> {
  List<Widget> ArrDiv = [];
  int intTap = 0;
  @override
  void initState() {
    super.initState();
    intTap = widget.index;
    funAddDiv(); //构建列表
  }

  void funSetState(int x) {
    setState(() {
      intTap = x;
    });
    widget.onChanged({
      "index": x,
      "name": widget.arrName[x],
    });
    funAddDiv(); //驱动更新Div
  }

  void funAddDiv() {
    ArrDiv = [];
    for (var i = 0; i < widget.arrName.length; i++) {
      ArrDiv.add(
        InkWell(
          key: UniqueKey(),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          onTap: () {
            funSetState(i); //驱动更新
          },
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Transform.scale(
                    scale: widget.size == 0 ? 1 : (widget.size - 0.2),
                    child: Radio(
                      activeColor: widget.color,
                      value: i,
                      groupValue: intTap,
                      onChanged: (v) {
                        funSetState(v!); //驱动更新
                      },
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact, //收缩
                    ),
                  ),
                  Text(
                    widget.arrName[i],
                    style: TextStyle(
                      fontSize: widget.size == 0 ? 16 : (widget.size * 13),
                      color: widget.fontColor,
                    ),
                  ),
                  const SizedBox(width: 7),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Wrap(
      children: ArrDiv,
    ));
  }
}
