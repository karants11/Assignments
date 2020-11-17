protocol UniversityRecieveProtocol {
	// protocols that are necessary for recieving data from the respective colleges
	func sendStudentList() -> [String: [String: Student]]
}

protocol CollegeRecieveProtocol {
 // protocol that are necessaryfor recieving data from all the branches
 func sendStudentListToCollege() -> [String: Student]
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

extension Branch: CollegeRecieveProtocol {
 
 func sendStudentListToCollege() -> [String: Student] {
	 return self.students
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
}

extension College: UniversityRecieveProtocol {
	func sendStudentList() -> [String: [String: Student]] {
		var studentList = [String: [String: Student]]()
		for branch in self.branches {
			studentList[branch.name] = branch.sendStudentListToCollege()
		}
		return studentList
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
	var listOfColleges = [String: UniversityRecieveProtocol]()
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