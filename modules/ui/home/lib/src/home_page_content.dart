import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/state_management.dart';

import 'widgets/image_container.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    print('main built');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('A provider Demo'),
          actions: [
            InkWell(
              onTap: () => context.read<ImagesPlayerProvider>().toggle(),
              child: SizedBox(
                width: 100,
                child: Consumer<ImagesPlayerProvider>(
                  builder: (context, provider, widget) => SizedBox(
                      width: 50,
                      height: 50,
                      child: Icon(
                        provider.isPlaying
                            ? Icons.pause_circle
                            : Icons.play_circle,
                        size: 50,
                      )),
                ),
              ),
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer<ThemeProvider>(
                builder: (context, provider, widget) => Container(
                  height: 100,
                  alignment: Alignment.center,
                  color: provider.theme.scaffoldBackgroundColor,
                  child: Text(
                    'Click on the buttons and see what happens',
                    style: provider.theme.textTheme.headlineLarge
                        ?.copyWith(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const Expanded(
                child: ImageContainer(),
              ),
              Consumer<NumberProvider>(
                builder: (context, provider, widget) => Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    width: 50,
                    height: 50,
                    child: Text(
                      '${provider.count}',
                      style: Theme.of(context).textTheme.displayLarge,
                    )),
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(left: 30),
          // width: MediaQuery.of(context).size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () => context.read<NumberProvider>().increment(),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () => context.read<NumberProvider>().decrement(),
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
