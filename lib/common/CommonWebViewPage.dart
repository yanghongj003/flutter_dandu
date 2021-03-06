
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_dandu/common/CommentPage.dart';

/// 公共WebView页面

class CommonWebViewPage extends StatefulWidget {
  @override
  final String url;
  final String post_id;
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  CommonWebViewPage({Key key, @required this.url,this.post_id}) : super(key: key);
  _CommonWebViewPageState createState() => _CommonWebViewPageState();
}

class _CommonWebViewPageState extends State<CommonWebViewPage> {

  bool _isFavorite = true;
  @override
  void initState() {
    super.initState();
  }

  void _toFavorite() {
    setState(() {
      /// 如果目前被收藏
      if (_isFavorite) {
        _isFavorite = false;
        /// 未被收藏
      } else {
        _isFavorite = true;
      }
    });
  }
  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          actions: <Widget>[
            new IconButton(icon:(_isFavorite ? Image.asset('assets/store_normal_28x26_@2x.png') : Image.asset('assets/store_selected_28x26_@2x.png')),
                onPressed: (){
                  _toFavorite();
                }
            ),
            new IconButton(icon: Image.asset('assets/comment_normal_26x27_@2x.png'),
                onPressed: (){
               widget.flutterWebviewPlugin.close();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) {
                    return new CommentPageStateful(post_id: widget.post_id);
                  }));
                }
            ),
            new IconButton(icon: Image.asset('assets/share_normal_19x26_@1x.png'),
                onPressed: (){

                }
            ),
          ],
        ),
        body: _WebView(widget.url),
      ),
    );
  }
}

Widget _WebView(String url) {
  return WebviewScaffold(url: url);
}

