
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
		print("Mobile Number updated") 
	}

	func updateEMail(eMailID: String) {
		self.eMailID = eMailID
		print("e-Mail ID updated")
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
	var requests: [Request]

	init() {
		self.accountList = [Int: ManagerProtocol]()
		self.latestAccountNumber = 1234567890000
		self.requests = [Request]()
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

	func recieveRequest(request: Request) {
		self.requests.append(request)
	}

	func processRequest() {
		for request in requests {
			let req = request.request

			var amount: Int = 0
			if let temp = request.amount{
				amount = temp
			}

			var eMail: String = " "
			if let temp = request.eMail {
				eMail = temp
			}

			var mobileNumber: String = " "
			if let temp = request.mobileNumber {
				mobileNumber = temp
			}
			
			switch req {
				case .withdraw:  self.withdrawAmount(account: request.account, amount: amount)
				case .deposit: self.depositeAmount(account: request.account, amount: amount)
				case .addAccount: addAccount(account: request.account)
				case .queryCurrentBalance: self.queryCurrentBalance(account: request.account)
				case .accountStatement: self.dispalyDetails(account: request.account)
				case .updateMobileNumber: request.account.detail.updateMobileNumber(mobileNumber: mobileNumber)
				case .updateEMail: request.account.detail.updateEMail(eMailID: eMail)
			}
			self.requests.removeFirst()
		}
	}
}

class Request {
	
	var request: AvailableRequests 
	var account: ManagerProtocol
	var amount: Int?
	var eMail: String?
	var mobileNumber: String?
	
	// init for checking balance and print acount detail
	init (request: AvailableRequests, account: ManagerProtocol) {
		self.account = account
		self.request = request
	}

	// Init to withdraw, deposit amount
	init (request: AvailableRequests, account: ManagerProtocol, amount: Int?) {
		self.account = account
		self.request = request
		self.amount = amount
	}

	// init for updating eMail ID
	init (request: AvailableRequests, account: ManagerProtocol, eMailToUpdate: String?) {
		self.account = account
		self.request = request
		self.eMail = eMailToUpdate
	}

	// Init to update mobileNumber
	init (request: AvailableRequests, account: ManagerProtocol, mobileNumberToUpdate: String) {
		self.account = account
		self.request = request
		self.mobileNumber = mobileNumberToUpdate
	}


}

enum AvailableRequests {
	case withdraw
	case deposit
	case addAccount
	case queryCurrentBalance
	case accountStatement
	case updateMobileNumber
	case updateEMail
}

var manager = AccountManager()

var consumerSave = SavingsAccount(name: "Mr. save", initialAmount: 500)
var consumerCurrent = CurrentAccount(name: "Mr.Current", initialAmount: 500)
var consumerFD = FDAccount(name: "Mr. FD", initialAmount: 100000, depositTerm: 365)
var consumerReccur = RecurringDepositAccont(name: "Mr. reccur", initialAmount: 10000, depositTerm: 365)
var consumerVehicalLoan = VehicalLoanAccount(name: "Mr. vehicalLoan", initialAmount: 50000)

let request1 = Request(request: .addAccount, account: consumerSave)
let requestSave = Request(request: .deposit, account: consumerSave, amount: 500)
let requestSaveWithdraw = Request(request: .withdraw, account: consumerSave, amount: 200)
let requestSaveEmail = Request(request: .updateEMail, account: consumerSave, eMailToUpdate: "mr.save@robosoftin.com")
let requestSaveMobile = Request(request: .updateMobileNumber, account: consumerSave, mobileNumberToUpdate: "8889994447")
let requestSaveQuery = Request(request: .accountStatement, account: consumerSave)


let request2 = Request(request: .addAccount, account: consumerCurrent)
let requestCurrent = Request(request: .deposit, account: consumerCurrent, amount: 500)
let requestCurrentWithdraw = Request(request: .withdraw, account: consumerCurrent, amount: 200)
let requestCurrentEmail = Request(request: .updateEMail, account: consumerCurrent, eMailToUpdate: "mr.Current@robosoftin.com")
let requestCurrentMobile = Request(request: .updateMobileNumber, account: consumerCurrent,mobileNumberToUpdate: "8889993337")
let requestCurrentQuery = Request(request: .accountStatement, account: consumerCurrent)

let request3 = Request(request: .addAccount, account: consumerFD)
let requestFd = Request(request: .deposit, account: consumerFD, amount: 500)
let requestFdWithdraw = Request(request: .withdraw, account: consumerFD, amount: 200)
let requestFdEmail = Request(request: .updateEMail, account: consumerFD, eMailToUpdate: "mr.FD@robosoftin.com")
let requestFdMobile = Request(request: .updateMobileNumber, account: consumerFD, mobileNumberToUpdate: "8889992229")
let requestFdQuery = Request(request: .accountStatement, account: consumerFD)

let request4 = Request(request: .addAccount, account: consumerReccur)
let requestReccur = Request(request: .deposit, account: consumerReccur, amount: 500)
let requestReccurWithdraw = Request(request: .withdraw, account: consumerReccur, amount: 200)
let requestReccurEmail = Request(request: .updateEMail, account: consumerReccur, eMailToUpdate: "mr.reccur@robosoftin.com")
let requestReccurMobile = Request(request: .updateMobileNumber, account: consumerReccur, mobileNumberToUpdate: "8886662229")
let requestReccurQuery = Request(request: .accountStatement, account: consumerReccur)

let request5 = Request(request: .addAccount, account: consumerVehicalLoan)
let requestVehicalLoan = Request(request: .deposit, account: consumerVehicalLoan, amount: 500)
let requestVehicalLoanWithdraw = Request(request: .withdraw, account: consumerVehicalLoan, amount: 200)
let requestVehicalLoanEmail = Request(request: .updateEMail, account: consumerVehicalLoan, eMailToUpdate: "mr.requestVehicalLoan@robosoftin.com")
let requestVehicalLoanMobile = Request(request: .updateMobileNumber, account: consumerVehicalLoan, mobileNumberToUpdate: "999662229")
let requestVehicalLoanQuery = Request(request: .accountStatement, account: consumerVehicalLoan)

manager.recieveRequest(request: request1)
manager.recieveRequest(request: requestSave)
manager.recieveRequest(request: requestSaveWithdraw)
manager.recieveRequest(request: requestSaveEmail)
manager.recieveRequest(request: requestSaveMobile)
manager.recieveRequest(request: requestSaveQuery)

manager.recieveRequest(request: request2)
manager.recieveRequest(request: requestCurrent)
manager.recieveRequest(request: requestCurrentWithdraw)
manager.recieveRequest(request: requestCurrentEmail)
manager.recieveRequest(request: requestCurrentMobile)
manager.recieveRequest(request: requestCurrentQuery)

manager.recieveRequest(request: request3)
manager.recieveRequest(request: requestFd)
manager.recieveRequest(request: requestFdWithdraw)
manager.recieveRequest(request: requestFdEmail)
manager.recieveRequest(request: requestFdMobile)
manager.recieveRequest(request: requestFdQuery)

manager.recieveRequest(request: request4)
manager.recieveRequest(request: requestReccur)
manager.recieveRequest(request: requestReccurWithdraw)
manager.recieveRequest(request: requestReccurEmail)
manager.recieveRequest(request: requestReccurMobile)
manager.recieveRequest(request: requestReccurQuery)

manager.recieveRequest(request: request5)
manager.recieveRequest(request: requestVehicalLoan)
manager.recieveRequest(request: requestVehicalLoanWithdraw)
manager.recieveRequest(request: requestVehicalLoanEmail)
manager.recieveRequest(request: requestVehicalLoanMobile)
manager.recieveRequest(request: requestVehicalLoanQuery)

manager.processRequest()

/*
let req = Request(request: .withdraw, account: consumerSave, amount: 500)
let reqTest = Request(request: .deposit, account: consumerSave)
manager.recieveRequest(request: req)
manager.recieveRequest(request: reqTest)
manager.processRequest()
*/