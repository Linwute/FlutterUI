Flutter UI Widget；flutter 组件库 <br>
【Flutter 提示框组件】 Linwute 在2023-07-01开发 E-Mail: Linwute@tom.com <br>
前端怎么就那么难找工作呢！ <br>

 ============ cn ========== <br>
 首先需要下载 文件，并引入项目内容下. <br>
 
消息提示框  使用方式：showToast(context, 3, "标题", "内容"); <br>
显示模态弹窗 使用方式：showModal(context, "标题", "内容", "确认", "关闭").then((index) => {}); <br>
显示模态弹窗2 使用方式：showModal2(context, "标题", "内容", "确认", "关闭", "取消").then((index) => {}); <br>
显示模态弹窗3 使用方式：showModal3(context, "标题", "内容", "确认", "关闭", "取消","退出").then((index) => {}); <br>
显示模态内容弹窗 使用方式：showModalText(context, "标题", "提示内容", '输入内容', '输入框提示', '确认', '取消').then((value) {}); <br>
加载状态提示框 使用方式： showLoading(context, "加载中...", "已上传（2/7）"); <br>
隐藏消息提示框 使用方式： hideToast(context); <br>
从底部向上弹出列表菜单 使用方式：showActionSheet(context, "标题", ['aaaa', 'bbbb', 'cccc'], 1).then((res) => {}); <br>


============ en ========== <br>
First, you need to download the file and import it into the project content. <br>

Message Toast usage：showToast(context, int seconds, "Title", "Context text"); <br>
Display Modal Popup No.1 usage：showModal(context, "Title", "Context text", "OK", "No").then((index) => {}); <br>
Display Modal Popup No.2 usage：showModal2(context, "Title", "Context text", "OK", "No", "off").then((index) => {}); <br>
Display Modal Popup No.3 usage：showModal3(context, "Title", "Context text", "OK", "No", "off", "out").then((index) => {}); <br>
Display Loading Popup usage： showLoading(context, "Loading...", "Get update（2/7）"); <br>
Hide message Tooltip usage： hideToast(context); <br>
.... <br>
