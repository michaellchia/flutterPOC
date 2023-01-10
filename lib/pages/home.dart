import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_poc/pages/webview.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late WebViewController wvController;
  Future<void> _launchUrl(String url, bool inApp) async {
    final Uri uri = Uri(scheme: 'https', host: url);
    if(!await launchUrl(
      uri,
      mode: inApp ? LaunchMode.inAppWebView : LaunchMode.externalApplication,
    )){
      throw "Can not launch url";
    }
  }

  Widget getWidget(int index){
    List<Widget>widgets = [
      Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('ESS', style: TextStyle(fontSize: 18),),
                  onPressed: () async {
                    WebViewPage wvPage = new WebViewPage('https://ess.apps.fmi.com', 'ESS');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => wvPage));
                  },
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('FMHome', style: TextStyle(fontSize: 18),),
                  onPressed: () async {
                    WebViewPage wvPage = new WebViewPage('https://fmhome.apps.fmi.com', 'FMHome');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => wvPage));
                  },
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('Total Rewards', style: TextStyle(fontSize: 18),),
                  onPressed: () async {
                    WebViewPage wvPage = new WebViewPage('https://totalrewards.apps.fmi.com', 'Total Rewards');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => wvPage));
                  },
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('GCC', style: TextStyle(fontSize: 18),),
                  onPressed: () async {
                    WebViewPage wvPage = new WebViewPage('https://globalcallcenter.apps.fmi.com', 'GCC');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => wvPage));
                  },
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('GCC', style: TextStyle(fontSize: 18),),
                  onPressed: () async {
                    WebViewPage wvPage = new WebViewPage('https://blibli.com', 'GCC');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => wvPage));
                  },
                ),
              )
            ],
          )
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text('ESS', style: TextStyle(fontSize: 18),),
                onPressed: () async {
                  _launchUrl('ess.apps.fmi.com', false);
                },
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text('FMHome', style: TextStyle(fontSize: 18),),
                onPressed: () async {
                  _launchUrl('fmhome.apps.fmi.com', false);
                },
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text('Total Rewards', style: TextStyle(fontSize: 18),),
                onPressed: () async {
                  _launchUrl('totalrewards.apps.fmi.com', false);
                },
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text('GCC', style: TextStyle(fontSize: 18),),
                onPressed: () async {
                  _launchUrl('globalcallcenter.apps.fmi.com', false);
                },
              ),
            )
          ],
        )
      ),
    ];

    return widgets[index];
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Apps List'),
      ),
      body: getWidget(_currentIndex),
      bottomNavigationBar: Row(
        children: <Widget>[
          buildNavBarItem(Icons.apps, 0, 'WebView'),
          buildNavBarItem(Icons.open_in_browser, 1, 'OS API')
        ],

      ),
    );
  }

  Widget buildNavBarItem(IconData icon, int index, String label)
  {
    return GestureDetector(
      onTap: (){
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          color: index == _currentIndex ? Colors.blue : Colors.white,
        ),
        child: Column(
          children: [
            Icon(icon),
            SizedBox(height: 10,),
            Text(label)
          ],
        ),
      ),
    );
  }
}