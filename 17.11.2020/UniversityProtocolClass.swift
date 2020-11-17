protocol UniversityRecieveProtocol {
	// protocols that are necessary for recieving data from the respective colleges
	func sendStudentList() -> [String: [String: Student]]
}

protocol UniversitySendProtocol {
	func recieveTimeTable(timetable: [String: String])
	func maxIntakeCount(intakeCount: [String: Int])
	func recieveStudentResults(result: [String: Int])
}

protocol CollegeRecieveProtocol {
 // protocol that are necessary for recieving data from all the branches
 func sendStudentListToCollege() -> [String: Student]
}

protocol CollegeSendProtocol {
	// protocols that are necessary for sending data to the branches
	func recieveEventDetails(events: [String: String])
}

class Person {
	let name: String
	var age: Int

	init(name: String, age: Int) {
		self.name = name
		self.age = age
	}
}

class Student: Person {
	var usnNumber: String
	var currentCGPA: Float
	let yearOfJoining : Int
	let libraryCardNumber: String
	
	init(name: String, age: Int, libraryCardNumber: String, yearOfJoining: Int) {
		self.usnNumber = ""
		self.currentCGPA = 0.0
		self.libraryCardNumber = libraryCardNumber
		self.yearOfJoining = yearOfJoining
		super.init(name: name, age: age)
	}

}

class Branch {
	let name: String
	var headOfDepartment: String
	var students = [String: Student]()    // USN : student detail
	var internalMarks = [String: [String: Float]]()
	var studentCount: Int

	init(name: String, headOfDepartment: String) {
		self.name = name
		self.headOfDepartment = headOfDepartment
		self.studentCount = 0
	}
}

extension Branch: CollegeRecieveProtocol, CollegeSendProtocol {
 
 func sendStudentListToCollege() -> [String: Student] {
	 return self.students
 }

 func recieveEventDetails(events: [String: String]) {
	 // display the event details in the department notice board
	 print("\(self.name) notice board")
	 print(events)
 }

}

class College {
	var name: String
	var collegeID: String
	var principalName: String
	var branches = [Branch]()
  
	init(name: String, principalName: String, details: String, branches: [Branch]) {
      
    self.name = name
    self.collegeID = ""
    self.principalName = principalName
    self.branches = branches
	}

	func admitStudent(student: Student, prefferedBranch: Branch) {
		student.usnNumber = self.allocateUSN(student: student, prefferedBranch: prefferedBranch)
		//fill detail of student
		//and issue library card sor student
		prefferedBranch.students[student.usnNumber] = student
	}

	func allocateUSN(student: Student, prefferedBranch: Branch) -> String {
		prefferedBranch.studentCount += 1
		let usn = String(self.collegeID + String(student.yearOfJoining) + prefferedBranch.name + "00" + String(prefferedBranch.studentCount))
		//print(usn)
		return usn
	}

	func addBranch(branch: Branch) {
		self.branches.append(branch)
	}

	func sendEventDetail() {
		let events = ["14/11/2020": "naraka chaturdashi", "15/11/2020": "deepavali", "16/11/2020": "Goupooja"]
		for branch in branches {
			branch.recieveEventDetails(events: events)
		}
	}
}

extension College: UniversityRecieveProtocol, UniversitySendProtocol {
	
	func sendStudentList() -> [String: [String: Student]] {
		var studentList = [String: [String: Student]]()
		for branch in self.branches {
			studentList[branch.name] = branch.sendStudentListToCollege()
		}
		return studentList
	}

	func recieveTimeTable(timetable: [String: String]) {
		// timetable from the university has been recieved put it in the notice board or send it to individual student
		print("\(self.name) notice board")
		print(timetable) // just as displayed un the notice board
	}

	func maxIntakeCount(intakeCount: [String: Int]) {
		// max intake count of all the branch is pblished by the university
		// display it in the notice board or send it to the respective branches
		print("\(self.name) notice board")
		print(intakeCount)
	}

	func recieveStudentResults(result: [String: Int]) {
		// university will declare the result
		// displayit in the notice board or send it to individual student
		print("\(self.name) notice board")
		print(result)
	}

}

class Details {
	var name: String
	var yearOfEstablishment: Int
	var location: String

	init() {
		self.name = " "
		self.yearOfEstablishment = 0
		self.location = " "
	}
}

class University {
	var details = Details()
	var listOfColleges = [String: College]()
	var studentList = [String: [String: [String: Student]]]()    // [collegeName: [branch:[usnNumber: StudentDetail]]]
	
	init(name: String, yearOfEstablishment: Int, location: String) {
		self.details.name = name
		self.details.yearOfEstablishment = yearOfEstablishment
		self.details.location = location
	}

	func addCollege(college: College, prefferedCollegeID: String) {
		college.collegeID = prefferedCollegeID
		listOfColleges[prefferedCollegeID] = college
	}

	func recieveStudentList(college: College) {
		self.studentList[college.name] = college.sendStudentList()
		//print(studentList)
	}

	func sendTimeTable() {
		// create approprite timtable with date and exams/ subject code and assign it to a variable
		let timetable = ["18/11/2020": "20EC11", "19/11/2020": "20EC12", "20/11/2020": "20EC13", ]
		for (_, college) in listOfColleges {
			college.recieveTimeTable(timetable: timetable)
		}
	}

	func sendIntakeCount() {
		// intakeCount to all the colleges and each branch should be calculated and sent to the respetive colleges
		// here assumed as all the colleges have same intake respective branches
		let intake = ["ECE": 120, "CSE": 120, "ISE": 60, "EEE": 60, "ME": 60, "CV": 60]
		for (_, college) in listOfColleges {
			college.maxIntakeCount(intakeCount: intake)
		}
	}

	func announceResult() {
		// result of all the student in all the colleges should be declared
		// marks will be dictionay of name of subject and marks for each usnNumber
		// for demo purpose a dictionary of usnNumber and percentage is sent to the college
		let result = ["4SU2020EC001": 86, "4SU2020EC002": 90, "4SU2020CS001": 90, "4SU2020CS002": 95, "4SU2020IS001": 80, "4SU2020IS002": 95]
		for (_, college) in listOfColleges {
			college.recieveStudentResults(result: result)
		}
	}

}


var vtu = University(name: "VTU", yearOfEstablishment: 1969, location: "Belgavi")

var student1 = Student(name: "student1", age: 21, libraryCardNumber: "ab001", yearOfJoining: 2020)
var student2 = Student(name: "student2", age: 20, libraryCardNumber: "ab002", yearOfJoining: 2020)

var student3 = Student(name: "student3", age: 21, libraryCardNumber: "ab003", yearOfJoining: 2020)
var student4 = Student(name: "student4", age: 21, libraryCardNumber: "ab004", yearOfJoining: 2020)

var student5 = Student(name: "student5", age: 20, libraryCardNumber: "ab005", yearOfJoining: 2020)
var student6 = Student(name: "student6", age: 21, libraryCardNumber: "ab006", yearOfJoining: 2020)

var ece = Branch(name: "EC", headOfDepartment: "Dr. SDM EC")
var cse = Branch(name: "CS", headOfDepartment: "Dr. SDM CS")
var ise = Branch(name: "IS", headOfDepartment: "Dr. SDM IS")

var sdmit = College(name: "SDM IT", principalName: "Dr. SDMIT", details: "At Ujire", branches: [ece, cse, ise])

vtu.addCollege(college: sdmit, prefferedCollegeID: "4SU")

sdmit.admitStudent(student: student1, prefferedBranch: ece)
sdmit.admitStudent(student: student2, prefferedBranch: ece)

sdmit.admitStudent(student: student3, prefferedBranch: cse)
sdmit.admitStudent(student: student4, prefferedBranch: cse)

sdmit.admitStudent(student: student5, prefferedBranch: ise)
sdmit.admitStudent(student: student6, prefferedBranch: ise)

vtu.recieveStudentList(college: sdmit)

vtu.sendTimeTable()
vtu.sendIntakeCount()
vtu.announceResult()

sdmit.sendEventDetail()
