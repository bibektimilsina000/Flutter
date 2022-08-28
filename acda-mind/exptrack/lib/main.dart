import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

import './widgets/transactions_list.dart';
import './widgets/new_transaction.dart';
import './widgets/chart.dart';

import './models/transaction.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      home: const MyHomePage(),
      theme: ThemeData(
        errorColor: Colors.red,
        fontFamily: 'OpenSans',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
            .copyWith(secondary: Colors.amber),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (bCtx) {
          return NewTransaction(addTranx);
        });
  }

  final List<Transaction> transactions = [];

  void addTranx(String title, double amount, DateTime choosenDate) {
    final newtx = Transaction(
      title: title,
      amount: amount,
      date: choosenDate,
      id: choosenDate.toString(),
    );

    setState(() {
      transactions.add(newtx);
    });
  }

  List<Transaction> get recentTransaction {
    return transactions.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void deleteTransaction(String id) {
    setState(() {
      transactions.removeWhere((element) => element.id == id);
    });
  }

  bool showChart = false;

  //widgets

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appbar = AppBar(
      title: const Text('Personal Expenses'),
      actions: [
        IconButton(
          onPressed: () => startAddNewTransaction(context),
          icon: const Icon(Icons.add),
        )
      ],
    );

    double height = ((MediaQuery.of(context).size.height) -
        (appbar.preferredSize.height) -
        2 * (MediaQuery.of(context).padding.top));

    return Scaffold(
      appBar: appbar,
      floatingActionButton: FloatingActionButton(
        onPressed: () => startAddNewTransaction(context),
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Show chart'),
                  Switch(
                    value: showChart,
                    onChanged: (value) {
                      setState(() {
                        showChart = value;
                      });
                    },
                  )
                ],
              ),
            if (!isLandscape)
              SizedBox(height: height * 0.2, child: Chart(transactions)),
            if (!isLandscape)
              SizedBox(
                  height: height,
                  child:
                      TransactionsList(recentTransaction, deleteTransaction)),
            if (isLandscape)
              showChart
                  ? SizedBox(height: height, child: Chart(transactions))
                  : SizedBox(
                      height: height,
                      child: TransactionsList(
                          recentTransaction, deleteTransaction)),
          ],
        ),
      ),
    );
  }
}
