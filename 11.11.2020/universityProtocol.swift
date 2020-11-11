
class Person {
	let name: String
	var age: Int

	init(name: String, age: Int) {
		self.name = name
		self.age = age
	}
}

class Staff: Person {
	let isTeaching: Bool
	var designation: String
	let qualification: String
  
	init(name:String, age: Int, isTeaching: Bool, designation: String, qualification: String) {
		self.isTeaching = isTeaching
		self.designation = designation
		self.qualification = qualification
		super.init(name: name, age: age)
	}
}

class Faculty: Staff {
	let department: String
	var handlingSubjects = [String]()
	var isMentor: Bool
	var menteeList: [Student]
	var anySpecialRole: String?
	var experience: Float

	init(name: String, age: Int, department: String, handlingSubjects: [String], isMentor: Bool, menteeList: [Student], anySpecialRole: String?, experience: Float, designation: String, qualification: String) {
		self.department = department
		self.handlingSubjects = handlingSubjects
		self.isMentor = isMentor
		self.menteeList = menteeList
		self.experience = experience
		if let temp = anySpecialRole {
					self.anySpecialRole = temp
		}
		super.init(name: name, age: age, isTeaching: true, designation: designation, qualification: qualification)
	}

	func guideMentees() {
	// menteeList is the list of students required only is isMentor true
	// guide and mentor mentees
	// keep track on their performance
	}

	func evaluateExamPapers(sutdents: [Student]) {
	// evaluate exam sheets of individual students and allot marks
	// giving CE marks for individual Student
	}

	func handleSubject() {
	// handle subject to the appropriate year as in handingSubjects
	}
}

class Student: Person {
	let usnNumber: String
	var currentCGPA: Float
	let libraryCardNumber: String
	var marks = [String: Float]()

	init(name: String, age: Int, usnNumber: String, libraryCardNumber: String) {
		self.usnNumber = usnNumber
		currentCGPA = 0.0
		self.libraryCardNumber = libraryCardNumber
		super.init(name: name, age: age)
	}

	func fetchCGPA() -> Float {
		return currentCGPA
	}

	func writeAssignments() {
		// write assignments
	}

	func takeTest() {
		// write Internals
	}
}

protocol CollageProtocol {
	func eventDetails()
	func sendAttendanceDetail()
	func sendInternalAssessmentMarks()
}


class Branch: CollageProtocol {
	let name: String
	var headOfDepartment: String
	var students = [String: Student]()    // USN : student detail
	var faculties = [Faculty]()
	var staffCount: Int
	var studentCount: Int
  
	init(name: String, headOfDepartment: String) {
		self.name = name
		self.headOfDepartment = headOfDepartment
		self.faculties = [Faculty]()
		self.students = [String: Student]()   // USN : student detail
		staffCount = faculties.count
		studentCount = students.count

	}
  
	func allotMark(student: Student, marks: [String: Float]) {
		student.marks = marks
	}
	
	func calculateCGPA(student: Student) -> Float {

		var sum: Float = 0
		for (_, value) in student.marks {
				sum += value
		}
		student.currentCGPA = (sum/Float(student.marks.count))/9.5
		return (sum/Float(student.marks.count))/9.5
	}

	func setTimetable() {
		// set timetable for all the years
		// faculty handingSubjectsmust match for perticular subjct and max 2 subject for a faculty
	}
   
	func conductExam() {
		// question papaer should be checked and distributed for all the students
	}

	func attendaceDetail(student: Student) {
		// attandacedetail every student should be stored
		// Student have only access to read the data not modify
	}

	func eventDetails() {
		// To Recieve the event details from the college
	}

	func sendAttendanceDetail() {
		// send attendance details of all the students to the college

	}
	func sendInternalAssessmentMarks() {
		// send Internal assessment marks of all the student to the college
	}
}

class College: UniversityProtocol, UniversityRecieveProtocol {
  
	var name: String
	var collegeID: String
	var principalName: String
	var details: String
	var branches = [Branch]()
	var staffs = [Staff]()
	var faculties = [Faculty]()
	var students = [Student]()
	weak var belongsToUniversity: University?
  
	init(name: String, collegeID: String, principalName: String, details: String, branches: [Branch]) {
      
    self.name = name
    self.collegeID = collegeID
    self.principalName = principalName
    self.details = details
    self.branches = branches
    //self.students = students
	}

	func admitStudent(student: Student, prefferedBranch: Branch) {
		//fill detail of student
		//and issue library card sor student
		prefferedBranch.students[student.usnNumber] = student
	}

	func recruitStaff(staff: Staff) {
		// recruit a staff menmber
	}

	func recruitFaculty(faculty: Faculty, prefferedBranch: Branch) {
		//recruit faculty 
		// append faculty to their respective branch
		prefferedBranch.faculties.append(faculty)
	}

	func feeCollection(student: Student) {
		//collect fees from student depending on branch and type of seat
	}

	func studentResult(students: [Student]) {
		// display result of individual student
		// display result branch wise
		// display overall result
	}

	func staffSalary(staff: Staff) {
		// staff salary database and payment
	}

	func wifiAccess(person: Any) {
		// wifi access database and permissions
	}

	func detailAndAchivements() {
		// list of achievents and collage detail display
	}

	func recieveTimeTable(timetable: [String: String]) {
		// recieveTimeTable from the University
		// send the timetable to the respective branches
	}

	func maxIntakeCount(intakeCount: [String: Int]) {
		// recieve maxIntakeCount of each branch
		// admit students only up to the max count
	}

	func recieveStudentResults(result: [String: Int]) {
		// recieve results of student from the university and send it to respective departments
	}

	func recieveStudentList() -> [Student] {
		return students
	}

	func sendStudentsListToUniversity() {
		if let temp = self.belongsToUniversity {
			temp.recieveStudentList(students: self.students)
		}else {
			print("\(self.name) does not belong to any University")  // if college dosent belong to any university
		}
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

protocol UniversityProtocol {
	func recieveTimeTable(timetable: [String: String])
	func maxIntakeCount(intakeCount: [String: Int])
	func recieveStudentResults(result: [String: Int])
}

protocol UniversityRecieveProtocol {
	// protocols that are necessary for recieving data from the respective colleges
	func recieveStudentList() -> [Student]
}

class University {
	var details = Details()
	var listOfColleges = [String: College]()
	
	init(name: String, yearOfEstablishment: Int, location: String) {
		self.details.name = name
		self.details.yearOfEstablishment = yearOfEstablishment
		self.details.location = location
	}

	func addCollege(college: College, prefferedCollegeID: String) {
		listOfColleges[prefferedCollegeID] = college
		/// add reference of university to the college
		college.belongsToUniversity = self	/*University(name: self.details.name, yearOfEstablishment: self.details.yearOfEstablishment, location: self.details.location)*/
	}

	
	func setMaximumIntake() -> [String: Int] {
		// set maxinum intakeCount of all the collages in the collage list appropriately
		return ["semester": 0]
	}
	

	func setSemesterTimetable() -> [String: String] {
		// set semester timetable of all the branches and courses
		return ["semester": "timetable"]
	}

	func paperEvaluation() {
		// paper evaluation of all the students and collages that comes nder the universtiy
		// faculties from all the collages are appended to duty based on ther domail and experience
		}

	func resultPublishing() {
		// result of all the students in the University is published branchwise or region wise or year wise
		// results can only be viewed by the students with their usn number cannot be modified 
	}

	func assigningOfUSNNumber(student: Student) {
		//each student is assigned with an unique USN
	}

	func recieveStudentList(students: [Student]) {
		// will recieve the student kist from inividual colleges
	}
}

// create a universtiy

var vtu = University(name: "VTU", yearOfEstablishment: 1990, location: "Belgavi")

// create a college
var ec = Branch(name: "EC", headOfDepartment: "Dr. ECE" )
var cs = Branch(name: "CS", headOfDepartment: "Dr. CSE")
var mech = Branch(name: "ME", headOfDepartment: "Dr. Mech")

var sdmit = College(name: "SDMIT", collegeID: "4SU", principalName: "Dr. SDMIT", details: "in Ujire", branches: [ec, cs, mech])

// create students

let student001 = Student(name: "ABD", age: 21,  usnNumber: "4su16ec001", libraryCardNumber: "001A")
let student002 =  Student(name: "DEF", age: 21,  usnNumber: "4su16ec002", libraryCardNumber: "002A")
let student003 =  Student(name: "GHI", age: 21,  usnNumber: "4su16ec003", libraryCardNumber: "003A")

//create staffs

let staff1 = Staff(name: "XYZ", age: 35, isTeaching: false, designation: "Lab Assistant", qualification: "Degree")
let staff2 = Staff(name: "MKJ", age: 45, isTeaching: false, designation: "Lab supervisor", qualification: "Degree")

// create Faculty

var faculty1 = Faculty(name: "Dr. ABC", age: 42, department: "EC", handlingSubjects: ["NA", "FT"], isMentor: true, menteeList: [student001, student002], anySpecialRole: "Nss Coordinstor", experience: 5.5, designation: "Ast. Proffessor", qualification: "MTech")
var faculty2 = Faculty(name: "Dr. DEC", age: 45, department: "EC", handlingSubjects: ["NA", "FT", "AE"], isMentor: true, menteeList: [student001, student002], anySpecialRole: nil, experience: 7.5, designation: "Proffessor", qualification: "Phd")

//  recruit faculties and staffs
sdmit.recruitFaculty(faculty: faculty1, prefferedBranch: ec)
sdmit.recruitFaculty(faculty: faculty2, prefferedBranch: cs)

// admit students

sdmit.admitStudent(student: student001, prefferedBranch: ec)
sdmit.admitStudent(student: student002, prefferedBranch: ec)
sdmit.admitStudent(student: student003, prefferedBranch: ec)
//sdmit.admitStudent(student: student002, prefferedBranch: cs)

// add college to universtiy
vtu.addCollege(college: sdmit, prefferedCollegeID: sdmit.collegeID)

// send the college list to the university
sdmit.sendStudentsListToUniversity()

// departmentwill allocate marks to the students
ec.allotMark(student: student001, marks:["LTE": 52, "OFC": 48, "Radar": 50])

if let temp = sdmit.belongsToUniversity {
	print(temp.details.name)
}

//////////////////////////////////////////////////////////////////
//// To check whether collegeis adding itself to university///////
let collegeTemp = College(name: "tempCollege", collegeID: "temp", principalName: "Dr. temp", details: "unavailable", branches: [])
collegeTemp.sendStudentsListToUniversity()
/////////////////////////////////////////////////////////////////