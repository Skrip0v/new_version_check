import 'package:flutter/material.dart';
import 'package:new_version_check/new_version_check.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<VersionStatus?> initVersion() async {
    var newVersionPlus = NewVersionCheck(iOSAppStoreCountry: 'ru');
    final status = await newVersionPlus.getVersionStatus();
    return status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: initVersion(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Error'),
                );
              } else if (snapshot.hasData) {
                VersionStatus? data = snapshot.data as VersionStatus;
                return Column(
                  children: [
                    Text('Can update: ${data.canUpdate}'),
                    Text('Local version: ${data.localVersion}'),
                    Text('Store version: ${data.storeVersion}'),
                    Text('App store link: ${data.appStoreLink}'),
                  ],
                );
              }
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
