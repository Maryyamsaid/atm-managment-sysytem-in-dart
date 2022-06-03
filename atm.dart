import 'dart:io';

class ATM {
  String? userName;
  String? accountId;
  var balance;
  int? choice;

  void createAccount() {
    print("enter your name");
    userName = stdin.readLineSync();
    print("enter account number");
    accountId = stdin.readLineSync();
    print("enter your balance");
    balance = double.tryParse(stdin.readLineSync()!);
  }

  void debit() {
    stdout.write('enter amount for credit= ');
    String? credit = stdin.readLineSync();
    double? amount = double.tryParse(credit!);
    balance = amount! + balance!;
    print("you new amount is $balance");
  }

  void cashWithdraw() {
    stdout.write('enter amount for withdraw= ');
    String? credit = stdin.readLineSync();
    double? amount = double.tryParse(credit!);
    if (amount! <= balance!) {
      print("your balance is low");
    } else {
      balance = balance! - amount;
      print("your new balance is =$balance");
    }
  }

  void balanceEnquiry() {
    print(" your balance is =$balance");
  }

  void accountDetail() {
    print("Account holder : $userName");
    print(" Account number : $accountId");
    print("your Current balance is: $balance");
  }

  void transfer() {
    int? accountId2;
    String? userName2;
    print('enter Account no');
    String accountId = stdin.readLineSync()!;
    accountId2 = int.tryParse(accountId);
    print("enter accountholder name");
    userName2 = stdin.readLineSync();
    print("Enetr account to transfer");
    String? credit1 = stdin.readLineSync();
    double? amount = double.tryParse(credit1!);
    if (amount! <= balance!) {
      print("your balance is low");
    } else {
      balance = balance! - amount;
      print(
          "you transfer $amount to account id=$accountId2 accountholder name= $userName2");
      print("  your new balance is =$balance");
    }
  }
}

main() {
  int pin = 8765;
  int pin1;

  do {
    print("ATM MANAGMENT SYSTEM");
    stdout.write('enter your 4 digit pin = ');
    String? pinn = stdin.readLineSync();
    pin1 = int.parse(pinn!);
    ATM atm = ATM();
    int? choice;
    if (pin1 == pin) {
      do {
        print("---------------Choice----------");
        print("1:create account ");
        print("2: Cash Withdraw ");
        print("3: Debit ");
        print("4: transfer ");
        print("5 : Balance Enquiry");
        print("6: For exit ");

        String? choicee = stdin.readLineSync();
        choice = int.tryParse(choicee!);

        if (choice == 1) {
          atm.accountDetail();
        }
        if (choice == 2) {
          atm.cashWithdraw();
        }
        if (choice == 3) {
          atm.debit();
        }
        if (choice == 4) {
          atm.transfer();
        }
        if (choice == 5) {
          print("program end");
        }
      } while (choice != 5);
      
    } else {
      print("SORRY ! your pin is invalid try Again ");
    }
  } while (pin1 != pin);

  print("");
}
