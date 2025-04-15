import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// For Android, iOS, and web support
// For hybrid composition mode (required for some Android versions)
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class SetupPayoutAccount extends StatefulWidget {
  const SetupPayoutAccount(
      {super.key, required this.payStackUrl, required this.referenceId});
  final String payStackUrl;
  final String referenceId;

  @override
  State<SetupPayoutAccount> createState() => _SetupPayoutAccountState();
}

class _SetupPayoutAccountState extends State<SetupPayoutAccount> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // Platform initialization
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);

    // For Android
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            if (url.contains(widget.referenceId)) {
              Navigator.of(context).pop();
              //  context.pop();
            }
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
        ),
      )
      // ..loadRequest(Uri.parse('https://flutter.dev'));
      ..loadRequest(Uri.parse(widget.payStackUrl));

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //  title: const Text('Flutter WebView'),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () async {
              if (await _controller.canGoBack()) {
                await _controller.goBack();
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () async {
              if (await _controller.canGoForward()) {
                await _controller.goForward();
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _controller.reload();
            },
          ),
        ],
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
