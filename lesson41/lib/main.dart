import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson41/bloc/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstBlocExample(),
    );
  }
}

class FirstBlocExample extends StatefulWidget {
  const FirstBlocExample({Key? key}) : super(key: key);

  @override
  State<FirstBlocExample> createState() => _FirstBlocExampleState();
}

class _FirstBlocExampleState extends State<FirstBlocExample> {
  late CounterBloc _bloc;
  int count = 0;

  @override
  void initState() {
    _bloc = CounterBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bloc example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: BlocBuilder<CounterBloc, CounterState>(
              bloc: _bloc,
              builder: (context, state) {
                if (state is CounterNum) {
                  count = state.amount;
                  return Text(
                    count.toString(),
                    style: TextStyle(fontSize: 50),
                  );
                }
                if (state is CounterLoading) {
                  return CircularProgressIndicator();
                }
                return Text(
                  '0',
                  style: TextStyle(fontSize: 50),
                );
              },
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                _bloc.add(IncrementCounterEvent(counter: count));
              }, child: Icon(Icons.plus_one)),
              ElevatedButton(
                  onPressed: () {
                    _bloc.add(UnIncrementCounterEvent(counter: count));
                  }, child: Icon(Icons.exposure_minus_1)),
            ],
          )
        ],
      ),
    );
  }
}
