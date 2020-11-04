
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
  var handlingSubjects: [String]
  var isMentor: Bool
  var menteeList = [Student]
  var anySpecialRole: String?
  var experience: Float

  init(name: String, age: Int, department: String, handlingSubjects: [String], isMentor: Bool, menteeList = [Student], anySpecialRole: String?, experience: Float) {
    self.department = department
    self.handlingSubjects = handlingSubjects
    self.isMentor = isMentor
    self.menteeList = menteeList
    self.experience = experience
    if let temp = anySpecialRole {
				anySpecialRole = temp
    }
    super.init(name: name, age: age)
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

  init(name: String, age: Int, usnNumber: String, currentCGPA: Float, libraryCardNumber: String) {
    self.usnNumber = usnNumber
    self.currentCGPA = currentCGPA
    self.libraryCardNumber = libraryCardNumber
    super.init(name: name, age: age)
  }

  func writeAssignments() {
    // write assignments
  }

  func takeTest() {
    // write Internals
  }
}

class College {
  
  var name: String
  var collegeID: String
  var principalName: String
  var details: String
  var branches: [Branch]
  var staffs: [Staff]
  var students: [Student]
  
  init(name: String, collegeID: String, principalName: String, details: String, branches: [Branch], staffs: [Staff], students: [Student]) {
      
    self.name = name
    self.collegeID = collegeID
    self.principalName = principalName
    self.details = details
    self.branches = branches
    self.students = students
  }

  func admitStudent(student: Student) {
    //fill detail of student
    //and issue library card sor student
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

  func detailAndAchivements(){
    // list of achievents and collage detail display
  }
}

class Branch {
  var headOfDepartment: String
  var students: [String: Student]
  var staffs: [Staff]

  init(headOfDepartment: String, students: [String: Student], staffs: [Staff] ){
    self.headOfDepartment = headOfDepartment
    self.students = students
    self.staffs = staffs
  }
  func setTimetable() {
    // set timetable for all the years
    // faculty handingSubjectsmust match for perticular subjct and max 2 subject for a faculty
  }
   
  func condutExam() {
    // question papaer should be checked and distributed for all the students
  }

  func attandaceDetail(student: Student) {
    // attandacedetail every student should be stored
    // Student have only access to read the data not modify
  }



}

class University: College {
  var listOfCollages: [String: Collage]


  func setSemesterTimetable() {
    // set semester timetable of all the branches and courses
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

}

let staff1 = Student(name: "ABD", age: 21,  usnNumber: "4su16ec025", currentCGPA: 8.0, libraryCardNumber: "193A")