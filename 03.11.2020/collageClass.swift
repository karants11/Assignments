class Student {

  var name: String
  var rollNo: String
  var yearOfJoining: Int
  var cgpa: Float
  var libraryCardNumber: Int

  init() {
    self.name = " "
    self.rollNo = " "
    self.yearOfJoining = 0
    self.cgpa = 0.0
    self.libraryCardNumber = 0 
  }

  func takeTest(){
    // some code
  }

  func attendanceDetail() {
    //keep track of attendance
  }
}

class Faculty: Student {
  
  var employeeID: Int
  var domainOfTeaching: String

  override init() {
  
    self.employeeID = 0
    self.domainOfTeaching = " "
    super.init()
      name = " "
      yearOfJoining = 0
  }

  func mentorDetails() {
    //record 0f mentees
  }

  func inChargeOfLabDetails() {
    // Lab details and record
  }
}

class Department: Faculty {

  var headOfDepartmentName: String
  var totalNumberOfSeat: Int
  var numberOfTotalStaffs: Int

  override init() {
    self.headOfDepartmentName = " "
    self.totalNumberOfSeat = 0
    self.numberOfTotalStaffs = 0
    super.init()
      name = " "
  }

  func conductExams() {
    // conduction of exams
  }

  func setTimeTable() {
    // setting of timetable based on number of students and staff as well as domainOfTeaching of individual Staffs
  }

  func recordOfStudentInEveryYear() {
    // keeping recordOfStudentInEveryYear
  }

  func allotmentOfMentors() {
    // alloting mentors for group of students basedon their interest andfaculty domain
  }
}

class Collage: Department {
  
  var collageID: Int
  var principalName: String
  var details: String

  override init() {
    self.collageID = 0
    self.principalName = " "
    self.details = " "
    super.init()
      name = " "

  }

  func admitStudents() {
    //fill detail of students
    //and issue library cards
  }
   func feeCollection() {
     //collect fees from students depending on branch
  }
  
  func studentResult() {
    // display result of individual student
    // display result branch wise
    // display overall result
  }

  func staffSalary() {
    // staff salary database and payment
  }

  func wifiAccess() {
    // wifi access database and permissions
  }

  func detailAndAchivements(){
    // list of achievents and collage detail display
  }
}

var myCollage = Collage()
myCollage.name = "SDM"
print(myCollage.name)