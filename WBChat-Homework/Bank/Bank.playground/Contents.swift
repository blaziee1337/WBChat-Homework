import Foundation

final class Account {
    
    let accountNumber: String
    var balance: Double
    
    init(accountNumber: String, balance: Double = 0.0) {
        self.accountNumber = accountNumber
        self.balance = balance
    }
    
    // Метод для пополнения счета
    func deposit(amount: Double) {
        balance += amount
        print("Deposited \(amount) to account \(accountNumber). New balance is \(balance).")
    }
    
    // Метод для снятия средств
    func withdraw(amount: Double) -> Bool {
        if balance >= amount {
            balance -= amount
            print("Withdrew \(amount) from account \(accountNumber). New balance is \(balance).")
            return true
            
        } else {
            print("Insufficient funds in account \(accountNumber).")
            return false
        }
    }
}

final class Bank {
    
    private var accounts: [String: Account] = [:]
    
    func addAccount(_ account: Account) {
        accounts[account.accountNumber] = account
        print("Added account \(account.accountNumber) with initial balance \(account.balance).")
    }
    
    func depositToAccount(accountNumber: String, amount: Double) {
        guard let account = accounts[accountNumber] else {
            print("Account \(accountNumber) not found.")
            return
        }
        account.deposit(amount: amount)
    }
    
    func transfer(fromAccount: String, toAccount: String, amount: Double) {
        guard let from = accounts[fromAccount] else {
            print("Account \(fromAccount) not found.")
            return
        }
        guard let to = accounts[toAccount] else {
            print("Account \(toAccount) not found.")
            return
        }
        
        if from.withdraw(amount: amount) {
            to.deposit(amount: amount)
            print("Transferred \(amount) from account \(fromAccount) to account \(toAccount).")
        }
    }
    
    func printAccounts() {
        for (accountNumber, account) in accounts {
            print("Account \(accountNumber): Balance \(account.balance)")
        }
    }
}


let bank = Bank()

// Добавляем несколько счетов
bank.addAccount(Account(accountNumber: "001", balance: 1000))
bank.addAccount(Account(accountNumber: "002", balance: 2000))
bank.addAccount(Account(accountNumber: "003", balance: 3000))

// Печатаем состояние всех счетов до выполнения операций
print("Initial Account Balances")
bank.printAccounts()

// Выполняем операции пополнения и перевода средств
bank.depositToAccount(accountNumber: "001", amount: 500)
bank.transfer(fromAccount: "002", toAccount: "003", amount: 1000)

// Печатаем состояние всех счетов после выполнения операций
print("Final Account Balances")
bank.printAccounts()

