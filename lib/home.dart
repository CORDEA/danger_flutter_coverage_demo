import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'home_view_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => HomeViewModel(context.read()),
        child: _HomePage(),
      );
}

class _HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeViewModel>().load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Selector<HomeViewModel, String>(
          selector: (_, viewModel) => viewModel.title,
          builder: (_, value, __) => Text(value),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Selector<HomeViewModel, String>(
              selector: (_, viewModel) => viewModel.status,
              builder: (_, value, __) => Text(
                value,
                textAlign: TextAlign.end,
              ),
            ),
            const SizedBox(height: 16),
            Selector<HomeViewModel, String>(
              selector: (_, viewModel) => viewModel.description,
              builder: (_, value, __) => Text(
                value,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            const SizedBox(height: 16),
            Selector<HomeViewModel, String>(
              selector: (_, viewModel) => viewModel.body,
              builder: (_, value, __) => Text(value),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => context.read<HomeViewModel>().onApproveTapped(),
              child: const Text('Approve'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.read<HomeViewModel>().onRejectTapped(),
              child: const Text('Reject'),
            ),
            const SizedBox(height: 64),
            ElevatedButton(
              onPressed: () => context.read<HomeViewModel>().onHoldTapped(),
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
