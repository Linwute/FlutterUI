// import 'dart:async';

import 'dart:async';

import 'package:flutter/material.dart';
/* 
  【Flutter 提示框组件】 2023-07-01 Linwute 开发 E-Mail: Linwute@tom.com
  消息提示框  使用方式：showToast(context, 3, "标题", "内容");
  显示模态弹窗 使用方式：showModal(context, "标题", "内容", "确认", "关闭", "取消").then((index) => {});
  显示模态弹窗2 使用方式：showModal2(context, "标题", "内容", "确认", "关闭", "取消").then((index) => {});
  显示模态弹窗3 使用方式：showModal3(context, "标题", "内容", "确认", "关闭", "取消","退出").then((index) => {});
  加载状态提示框 使用方式： showLoading(context, "加载中...", "已上传（2/7）");
  隐藏消息提示框 使用方式： hideToast(context);

*/

/* 显示消息提示框 */
Future showToast(
    BuildContext contexts, int seconds, String title, String text) async {
  try {
    return await showDialog(
      context: contexts,
      builder: (context) {
        Timer.periodic(Duration(seconds: seconds == 0 ? 3 : seconds), (timer) {
          Navigator.of(contexts).pop(); //定时关闭
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
          mainAxisAlignment: MainAxisAlignment.center, //居中
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
                fontSize: 16, color: Colors.white,
                decoration: TextDecoration.none, //字体底部横行
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

/* 自定义 异步返回 方法涵 */
Future<bool> funShow(BuildContext contexts) async {
  bool tfTap = false;

  try {
    return await showDialog(
      context: contexts,
      builder: (context) {
        return Text("业务块");
      },
    );
  } catch (e) {
    return Future.value(tfTap);
  } finally {
    return Future.value(tfTap);
  }
}
