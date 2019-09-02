import 'package:personal_expense_app/utilities/num_util.dart';
import 'package:personal_expense_app/utilities/random_util.dart';
import 'package:personal_expense_app/utilities/transaction_names.dart';
import 'package:uuid/uuid.dart';

import '../models/transaction.dart';

class TransactionListGenerator {
  static final uuid = new Uuid();

  static Transaction _generateRandomTransaction() {
    return Transaction(
      id: uuid.v1(),
      title: RandomUtil.randomItem(transactionNames),
      amount: RandomUtil.randomBetween(0.5, 200),
      date: RandomUtil.randomDate(
        DateTime.now().subtract(Duration(days: 10)),
        DateTime.now(),
      ),
    );
  }

  static List<Transaction> getTransactionList(int size) {
    var transactions = new List<Transaction>();

    for (var i = 0; i < size; i++) {
      transactions.add(_generateRandomTransaction());
    }

    return transactions;
  }
}
