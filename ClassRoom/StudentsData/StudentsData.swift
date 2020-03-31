//
//  StudentsData.swift
//  ClassRoom
//
//  Created by Igor Provorov on 2/24/20.
//  Copyright © 2020 Vadim Zhuk. All rights reserved.
//
import Foundation
import UIKit

class StudentsData: NSObject, UITableViewDataSource {
    var arrayOfStudents = [Profile]()
    var dataFromFile = ""
    override init() {
        super.init()
        studentsFromFile()
    }
    func studentsFromFile() {
        if let path = Bundle.main.path(forResource: "Names", ofType: "txt") {
            do {
                dataFromFile = try String(contentsOfFile: path)
            } catch {
                print("error: \(error)")
            }
        } else {
            print("file not found")
        }
        let arrayFromString = dataFromFile.split(separator: " ")
        arrayFromString.forEach { subStudent in
            arrayOfStudents.append(Profile(name: String(subStudent.split(separator: ".")[0]),
                                           surname: String(subStudent.split(separator: ".")[1]),
                                           age: String(subStudent.split(separator: ".")[2]),
                                           gender: String(subStudent.split(separator: ".")[3])))
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfStudents.count 
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var studentsCell = UITableViewCell()
        let student = arrayOfStudents[indexPath.row]
        switch student.gender {
        case "м": studentsCell = tableView.dequeueReusableCell(withIdentifier: "profile3", for: indexPath)
        case "ж": studentsCell = tableView.dequeueReusableCell(withIdentifier: "profile", for: indexPath)
        default:  studentsCell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath)
        }
        studentsCell.textLabel?.text = "\(student.name) \(student.surname)"
        return studentsCell
    }
    func removeStudentFromData(studentNumber: Int) {
        arrayOfStudents.remove(at: studentNumber)
    }
    func insertStudentArray(student: Profile, att: Int) {
        arrayOfStudents.insert(student, at: att)
    }
}
