import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rccg_jp/app_providers.dart';
import 'package:rccg_jp/core/observers/navigation.dart';
import 'package:rccg_jp/core/services/storage/store.dart';
import 'package:rccg_jp/src/res/theme/theme.dart';
import 'package:rccg_jp/src/router/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Store.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouter);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: false,
          useInheritedMediaQuery: true,
        builder: (context,child) {
          return MaterialApp.router(
            title: 'Flutter Demo',
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: ref.watch(themeModeProvider),
            routeInformationParser: router.defaultRouteParser(),
            routeInformationProvider: router.routeInfoProvider(),
            routerDelegate: AutoRouterDelegate(
              router,
              navigatorObservers: () => [
                AppRouteObservers(),
              ],
            ),
            backButtonDispatcher: RootBackButtonDispatcher(),
            //home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        }
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontFamily: 'Eudoxu'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
