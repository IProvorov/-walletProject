//
//  LessonOrTestViewController.swift
//  ClassRoom
//
//  Created by Igor Provorov on 2/9/20.
//  Copyright © 2020 Vadim Zhuk. All rights reserved.
//

import UIKit

class StudentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let students = StudentsData()
    var studentNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        students.tableView(tableView, numberOfRowsInSection: section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        students.tableView(tableView, cellForRowAt: indexPath)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
         ProfileManager.shared.studentNumber = indexPath.row
               tableView.deselectRow(at: indexPath, animated: true)
        let studentData = StudentsData()
        switch studentData.arrayOfStudents[indexPath.row].gender {
        case "м": performSegue(withIdentifier: "showProfile", sender: nil)
        case "ж": performSegue(withIdentifier: "showFeMaleProfile", sender: nil)
        default:
            performSegue(withIdentifier: "myProfile", sender: nil)
        }
    }
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            students.removeStudentFromData(studentNumber: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let student = students.arrayOfStudents[sourceIndexPath.row]
        students.insertStudentArray(student: student, att: destinationIndexPath.row)
        students.removeStudentFromData(studentNumber: sourceIndexPath.row)
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destinationVC = segue.destination as? MyProfileViewController
//        destinationVC?.studentNumber = studentNumber
//    }
}
