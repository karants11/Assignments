
class Detail {
	let name: String
	var mobileNumber: String?
	var eMailID: String?
	var isTransferable: Bool?

	init(name: String) {
		self.name = name
	}

	func updateMobileNumber(mobileNumber: String) {
		self.mobileNumber = mobileNumber 
	}

	func updateEMail(eMailID: String) {
		self.eMailID = eMailID
	}
}

protocol AccountProtocol {
	// protocols need to be followed by all kind of accounts and to should conform to Account class
}

class Account {
	var detail: Detail
	var amount: Int // acess restricted to access from main accessable from subclass only
	var accountNumber: Int	// acess restricted to access from main accessable from subclass only
	var accountType: AccountProtocol?	// acess restricted to access from main accessable from subclass only
	var rateOfInterest: Float

	init(name: String, initialAmount: Int) {
		self.amount = initialAmount
		self.accountNumber = 0
		self.detail = Detail(name: name)
		self.accountType = nil
		self.rateOfInterest = 6
	}
	// Protocol functions should be called only from Manager class/
	func depositeAmount(amount: Int) {
		self.amount += amount
		print("\(amount) Rupees deposited to account number \(self.accountNumber), Available Balance is \(self.amount) Rupees")
	}

	func withdrawAmount(amount: Int) {
		if ((self.amount - amount) >= 0) {
			self.amount -= amount
			print("\(amount) Rupees withdrawn form accountNumber \(self.accountNumber), Available Balance is \(self.amount) Rupees")
		}else {
			print("Insufficient Funds in accountNumber \(self.accountNumber) to withdraw")
			print("Available Balance is \(self.amount)")
		}		
	}

	func printAccountStatement() {
		// account statements is printed
	}

	func printRecentTransactions() {
		// last 10 transaction details need to be printed
	}

	func accrueInterest() {
		self.amount = Int(Float(self.amount) * (Float(self.amount) * rateOfInterest / 365))
	}
	
}

extension Account: ManagerProtocol {
	
	func printAmount() -> Int {
		return amount
	}

	func fetchAccountNumber() -> Int {
		return accountNumber
	}

	func setAccountNumber(accountNumber: Int) {
		self.accountNumber = accountNumber
	}

}

class CaSaAccount: Account, AccountProtocol {
	// no extra functions have to change
}

class CurrentAccount: CaSaAccount {
	// additional functionalities of Current account can be added here
}

class SavingsAccount: CaSaAccount {
	// additional functionalities of SavingsAccount can be added here
}

class DepositAccount: Account, AccountProtocol {
	let depositTerm: Int

	init(name: String, initialAmount: Int, depositTerm: Int) {
		self.depositTerm = depositTerm
		super.init(name: name, initialAmount: initialAmount)
			self.rateOfInterest = 0.1
	}
	override func withdrawAmount(amount: Int) {
		print("unable to withdraw amount, \(self.accountNumber) is a Deposit Account")
	}

	override func accrueInterest() {
		self.amount = Int(Float(self.amount) + (Float(self.amount) * self.rateOfInterest * Float(self.depositTerm)))
	}
}

class FDAccount: DepositAccount {

	override func depositeAmount(amount: Int) {
		print("\(self.accountNumber) is a FD account, Can be deposited only once")
	}

	override func printRecentTransactions() {
		print("Recent transactions Cannot be printed because this is a FD account")
	}
}

class RecurringDepositAccont: DepositAccount {
	// additional functionalities of RecurringDepositAccont can be added
}

class LoanAccount: Account, AccountProtocol {
	
	override func withdrawAmount(amount: Int) {
		print("This is a Loan Account, Cannot withdraw amount")
	}
}

class HouseLoanAccount: LoanAccount {
	// additional details or functionalities for housing loan can be added
}

class VehicalLoanAccount: LoanAccount {
	// additional details or functionalities for vehical loan can be added
}

class PersonalLoanAccount: LoanAccount {
	// additional details or functionalities for personal loan can be added
}

protocol ManagerProtocol {
	// protocols that should be followed by all the accounts
	var detail: Detail {get set}
	var accountType: AccountProtocol? {get set}
	var rateOfInterest: Float {get set}
	
	func printAmount() -> Int
	func fetchAccountNumber() -> Int
	func setAccountNumber(accountNumber: Int)

	func depositeAmount(amount: Int)
	func withdrawAmount(amount: Int)

	func accrueInterest() // for calcualating intrest 
} 

class AccountManager {

	var accountList: [Int: ManagerProtocol]
	var latestAccountNumber: Int

	init() {
		self.accountList = [Int: ManagerProtocol]()
		self.latestAccountNumber = 1234567890000
	}

	func dispalyDetails(account: ManagerProtocol) {
		print("Account Holder Name: \(account.detail.name)")
		print("Account Number: \(account.fetchAccountNumber())")
		
		if let mobile = account.detail.mobileNumber {
			print("mobile Number: \(mobile)")
		}else {
			print("Mobile Number not updated")
		}

		if let eMail = account.detail.eMailID {
			print("e-mail ID: \(eMail)")
		}else {
			print("e-mail ID not updated")
		}
	}

	func queryCurrentBalance(account: ManagerProtocol) {
		print("Current Balance: \(account.printAmount())")
	}

	func addAccount(account: ManagerProtocol) {
		account.setAccountNumber(accountNumber: self.generateAccountNumber())
		self.accountList[account.fetchAccountNumber()] = account
	}

	func generateAccountNumber() -> Int {
		self.latestAccountNumber += 1
		return self.latestAccountNumber 
	}

	func depositeAmount(account: ManagerProtocol, amount: Int) {
		account.depositeAmount(amount: amount)
	}

	func withdrawAmount(account: ManagerProtocol, amount: Int) {
		account.withdrawAmount(amount: amount)
	}

	func addInterest() {
		// adding intrest to consumer should be periodically done 
		// here for illustration purpose directly funcion is called
		// for i in 0...365.days
			//delay()
		for (_, account) in self.accountList{
			account.accrueInterest()
		}	
	}	
}

var manager = AccountManager()

var consumer1 = Account(name: "Mr. ABC", initialAmount: 500)
var consumer2 = Account(name: "Mr. MNO", initialAmount: 500)

manager.addAccount(account: consumer2)
manager.addAccount(account: consumer1)

manager.dispalyDetails(account: consumer1)
consumer1.detail.updateEMail(eMailID: "abc@robosoftin.com")
manager.dispalyDetails(account: consumer1)
print(manager.accountList)

var consumer12 = CaSaAccount(name: "Mr xyz", initialAmount: 500)
manager.addAccount(account: consumer12)
manager.withdrawAmount(account: consumer12, amount: 500)

var consumer13 = CaSaAccount(name: "Mr xyz", initialAmount: 500)
manager.addAccount(account: consumer13)
manager.depositeAmount(account: consumer13, amount: 500)
manager.withdrawAmount(account: consumer13, amount: 500)

var consumerFD = FDAccount(name: "Mr. save", initialAmount: 100000, depositTerm: 365)
manager.addAccount(account: consumerFD)
manager.depositeAmount(account:consumerFD, amount: 500)
manager.withdrawAmount(account:consumerFD, amount: 500)

var consumerReccur = RecurringDepositAccont(name: "Mr. reccur", initialAmount: 10000, depositTerm: 365)
manager.addAccount(account: consumerReccur)
manager.depositeAmount(account: consumerReccur, amount: 500)
manager.withdrawAmount(account: consumerReccur, amount: 500)

print(manager.accountList)

manager.queryCurrentBalance(account: consumerFD)
manager.queryCurrentBalance(account: consumer1)

manager.addInterest()

manager.queryCurrentBalance(account: consumerFD)
manager.queryCurrentBalance(account: consumer1)