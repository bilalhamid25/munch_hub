import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:munch_hub/widgets/loader.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'webview_viewmodel.dart';

// ignore: must_be_immutable
class WebViewView extends StatelessWidget {
  final WebViewModel webViewModel = Get.put(WebViewModel());
  late WebViewController controller;

  WebViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
        onWillPop: () async {
          if (await controller.canGoBack()) {
            controller.goBack();
            return false;
          } else {
            bool value = false;
            // ignore: use_build_context_synchronously
            await showDialog<bool>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: const Text('Are you sure you want to exit?'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('No'),
                        onPressed: () {
                          value = false;
                          Navigator.of(context).pop(false);
                        },
                      ),
                      TextButton(
                        child: const Text('Yes'),
                        onPressed: () {
                          value = true;
                          Navigator.of(context).pop(true);
                        },
                      ),
                    ],
                  );
                });

            return value;
          }
        },
        child: SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                Builder(
                  builder: (BuildContext context) {
                    return WebView(
                      gestureNavigationEnabled: true,
                      initialUrl: "https://munchrestaurant.drogenidesoftware.com/",
                      javascriptMode: JavascriptMode.unrestricted,
                      onWebViewCreated: (WebViewController webViewController) {
                        controller = webViewController;
                      },
                      onProgress: (val) {
                        if (val == 100) {
                          Loader.loader.value = false;
                        } else {
                          Loader.loader.value = true;
                        }
                      },
                      onPageStarted: (String url) {},
                    );
                  },
                ),
                const Loader()
              ],
            ),
          ),
        ));
  }
}
