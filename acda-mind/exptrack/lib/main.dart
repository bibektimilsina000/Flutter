import 'dart:io'; // for platform detection
import 'package:flutter/cupertino.dart';
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
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
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

  final isIos = Platform.isIOS;

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
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    final dynamic appbar = isIos
        ? CupertinoNavigationBar(
            middle: const Text('Personal Expenses'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: const Icon(CupertinoIcons.add),
                  onTap: () => startAddNewTransaction(context),
                )
              ],
            ),
          )
        : AppBar(
            title: const Text('Personal Expenses'),
            actions: [
              IconButton(
                onPressed: () => startAddNewTransaction(context),
                icon: const Icon(Icons.add),
              )
            ],
          );

    double height = ((mediaQuery.size.height) -
        (appbar.preferredSize.height) -
        (mediaQuery.padding.top));

    final bodyContent = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Show chart'),
                  Switch.adaptive(
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
              SizedBox(height: height * 0.25, child: Chart(transactions)),
            if (!isLandscape)
              SizedBox(
                  height: height * 0.75,
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

    return isIos
        ? CupertinoPageScaffold(
            navigationBar: appbar,
            child: bodyContent,
          )
        : Scaffold(
            appBar: appbar,
            floatingActionButton: isIos
                ? Container()
                : FloatingActionButton(
                    onPressed: () => startAddNewTransaction(context),
                    child: const Icon(Icons.add),
                  ),
            body: bodyContent,
          );
  }
}
