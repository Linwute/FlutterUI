import 'dart:async';
import 'package:flutter/material.dart';
/* 
  【Flutter 提示框组件】 2023-07-01 Linwute 开发 E-Mail: Linwute@tom.com
  前端怎么那么难找工作呢？

  消息提示框  使用方式：showToast(context, 3, "标题", "内容");
  显示模态弹窗 使用方式：showModal(context, "标题", "内容", "确认", "关闭").then((index) => {});
  显示模态弹窗2 使用方式：showModal2(context, "标题", "内容", "确认", "关闭", "取消").then((index) => {});
  显示模态弹窗3 使用方式：showModal3(context, "标题", "内容", "确认", "关闭", "取消","退出").then((index) => {});
  显示模态内容弹窗 使用方式：showModalText(context, "标题", "提示内容", '输入内容', '输入框提示', '确认', '取消').then((value) {});
  加载状态提示框 使用方式： showLoading(context, "加载中...", "已上传（2/7）");
  隐藏消息提示框 使用方式： hideToast(context);
  从底部向上弹出列表菜单 使用方式：showActionSheet(context, "标题", ['aaaa', 'bbbb', 'cccc'], 1).then((res) => {});
  
*/

/* 显示消息提示框 */
Future showToast(
    BuildContext contexts, int seconds, String title, String text) async {
  try {
    return await showDialog(
      context: contexts,
      builder: (context) {
        Timer.periodic(Duration(seconds: seconds == 0 ? 3 : seconds), (timer) {
          Navigator.of(contexts).pop();
          timer.cancel(); //关闭定时器
        });

        return AlertDialog(
          title: Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          content: text != "" ? Text(text) : null,
        );
      },
    );
  } catch (e) {
    return Future.value(true);
  } finally {
    return Future.value(true);
  }
}

/* 显示模态弹窗 */
Future<bool> showModal(BuildContext contexts, String title, String text,
    String okName, String noName) async {
  bool tfTap = false;

  try {
    return await showDialog(
      context: contexts,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: text != "" ? Text(text) : null,
          actions: [
            TextButton(
              child: Text(okName == "" ? '确认' : okName),
              onPressed: () {
                tfTap = true;
                Navigator.of(contexts).pop();
              },
            ),
            TextButton(
              child: Text(noName == "" ? '取消' : noName),
              onPressed: () {
                tfTap = false;
                Navigator.of(contexts).pop();
              },
            ),
          ],
        );
      },
    );
  } catch (e) {
    return Future.value(tfTap);
  } finally {
    return Future.value(tfTap);
  }
}

/* 显示模态弹窗2 */
Future<int> showModal2(BuildContext contexts, String title, String text,
    String okName, String noName, String offName) async {
  int intTap = 0;

  try {
    return await showDialog(
      context: contexts,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: text != "" ? Text(text) : null,
          actions: [
            TextButton(
              child: Text(okName == "" ? '确认' : okName),
              onPressed: () {
                intTap = 0;
                Navigator.of(contexts).pop();
              },
            ),
            TextButton(
              child: Text(noName == "" ? '取消' : noName),
              onPressed: () {
                intTap = 1;
                Navigator.of(contexts).pop();
              },
            ),
            TextButton(
              child: Text(offName == "" ? '关闭' : offName),
              onPressed: () {
                intTap = 2;
                Navigator.of(contexts).pop();
              },
            ),
          ],
        );
      },
    );
  } catch (e) {
    return Future.value(intTap);
  } finally {
    return Future.value(intTap);
  }
}

/* 显示模态弹窗3 */
Future<int> showModal3(BuildContext contexts, String title, String text,
    String okName, String noName, String offName, String outName) async {
  int intTap = 0;

  try {
    return await showDialog(
      context: contexts,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: text != "" ? Text(text) : null,
          actions: [
            TextButton(
              child: Text(okName == "" ? '确认' : okName),
              onPressed: () {
                intTap = 0;
                Navigator.of(contexts).pop();
              },
            ),
            TextButton(
              child: Text(noName == "" ? '取消' : noName),
              onPressed: () {
                intTap = 1;
                Navigator.of(contexts).pop();
              },
            ),
            TextButton(
              child: Text(offName == "" ? '关闭' : offName),
              onPressed: () {
                intTap = 2;
                Navigator.of(contexts).pop();
              },
            ),
            TextButton(
              child: Text(outName == "" ? '退出' : outName),
              onPressed: () {
                intTap = 3;
                Navigator.of(contexts).pop();
              },
            ),
          ],
        );
      },
    );
  } catch (e) {
    return Future.value(intTap);
  } finally {
    return Future.value(intTap);
  }
}

/* 显示模态内容弹窗 */
Future<dynamic> showModalText(BuildContext contexts, String title, String text,
    String inputs, String hintText, String okName, String noName) async {
  final size = MediaQuery.of(contexts).size;
  double width = (size.width / 1.2);
  if (width > 300) {
    width = 300;
  }

  dynamic Obj = {
    "tap": false,
    "context": inputs,
  };
  final _controller = TextEditingController(text: inputs);
  try {
    return await showDialog(
      context: contexts,
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width,
              height: 230,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 8), //插入间隔
                      Text(
                        title, //标题
                        maxLines: 1, //显示行数
                        overflow: TextOverflow.ellipsis, //益出显示省略号
                        style: const TextStyle(
                          fontSize: 17, color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none, //字体底部横行
                        ),
                      ),
                      const SizedBox(height: 8), //插入间隔
                      Text(
                        text, //内容
                        maxLines: 2, //显示行数
                        overflow: TextOverflow.ellipsis, //益出显示省略号
                        style: const TextStyle(
                          fontSize: 17, color: Colors.black38,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none, //字体底部横行
                        ),
                      ),
                      Material(
                        type: MaterialType.transparency,
                        child: TextField(
                          onChanged: (value) {
                            Obj['context'] = value;
                          },
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: hintText,
                            suffixIcon: IconButton(
                              onPressed: () {
                                _controller.clear();
                              },
                              icon: const Icon(Icons.clear), //删除图标
                            ),
                          ),
                          maxLines: 3,
                          keyboardType: TextInputType.multiline,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                    children: [
                      TextButton(
                        child: Text(okName == "" ? '确认' : okName),
                        onPressed: () {
                          Obj['tap'] = true;
                          Navigator.of(contexts).pop();
                        },
                      ),
                      TextButton(
                        child: Text(noName == "" ? '取消' : noName),
                        onPressed: () {
                          Obj['tap'] = false;
                          Navigator.of(contexts).pop();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  } catch (e) {
    return Future.value(Obj);
  } finally {
    return Future.value(Obj);
  }
}

/* 隐藏消息提示框 */
Future hideToast(BuildContext context) async {
  Navigator.of(context).pop(); //关闭窗口或返回窗口
}

/* 加载中提示框 */
Future showLoading(BuildContext contexts, String title, String text) async {
  try {
    return await showDialog(
      barrierDismissible: false, //遮挡层关闭
      context: contexts,
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.scale(
              scale: 1.8,
              child: const CircularProgressIndicator(
                // valueColor: AlwaysStoppedAnimation(Colors.blue), //背景色
                strokeWidth: 6,
              ),
            ),
            const SizedBox(height: 26),
            Text(
              title == "" ? '加载中...' : title,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        );
      },
    );
  } catch (e) {
    return Future.value(true);
  } finally {
    return Future.value(true);
  }
}

/* 隐藏loading提示框 */
Future hideLoading(BuildContext contexts) async {
  Navigator.of(contexts).pop();
}

/* 从底部向上弹出菜单 */
Future<dynamic> showActionSheet(
    BuildContext contexts, String title, List ArrList, int index) async {
  dynamic Obj = {
    "index": index,
    "context": "",
  };
  final size = MediaQuery.of(contexts).size;
  double heightx = (ArrList.length * 50);
  if (heightx > (size.height * 0.8)) {
    heightx = (size.height * 0.8);
  }
  try {
    return await showDialog(
      barrierDismissible: true,
      context: contexts,
      builder: (context) {
        return Container(
          height: heightx + 70,
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  //标题
                  Container(
                    width: size.width,
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    alignment: Alignment.center, //模块居中
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 239, 228, 228),
                      //设置四周圆角
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.black87,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  //内容
                  Container(
                    width: size.width,
                    height: heightx,
                    color: Colors.white,
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.all(15),
                    child: ListView.builder(
                      key: UniqueKey(),
                      padding: const EdgeInsets.all(0), //去除内边距
                      itemCount: ArrList.length,
                      itemBuilder: (BuildContext context, int value) {
                        return Material(
                          type: MaterialType.transparency,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Obj['index'] = value;
                                  Obj['context'] = ArrList[value];
                                  Navigator.of(contexts).pop();
                                },
                                child: Container(
                                  width: size.width,
                                  padding: const EdgeInsets.all(10),
                                  color: index == value ? Colors.black12 : null,
                                  child: Text(
                                    ArrList[value],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                              ),
                              const Divider(height: 1), //列表下横线
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  } catch (e) {
    return Future.value(Obj);
  } finally {
    return Future.value(Obj);
  }
}
