//
//  ProfileManager.swift
//  ClassRoom
//
//  Created by Igor Provorov on 2/24/20.
//  Copyright © 2020 Vadim Zhuk. All rights reserved.
//

import UIKit

class ProfileManager {
    static let shared = ProfileManager()
    private init() {}
    let students = StudentsData()
    var studentNumber = 0
    var name = ""
    var surname = ""
    var age = ""
    var gender = ""
    init (studentNumber: Int) {
        studentDataForProfile(studentNumber: studentNumber)
    }
    func studentDataForProfile(studentNumber: Int) {
        students.studentsFromFile()
        name = students.arrayOfStudents[studentNumber].name
        surname = students.arrayOfStudents[studentNumber].surname
        age = students.arrayOfStudents[studentNumber].age
        gender = students.arrayOfStudents[studentNumber].gender
    }
}
