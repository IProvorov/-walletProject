//
//  CollectionViewController.swift
//  ClassRoom
//
//  Created by Igor Provorov on 3/20/20.
//  Copyright © 2020 Vadim Zhuk. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    var storage = StudentsData()
    var students = StudentsData().arrayOfStudents
    override func viewDidLoad() {
        super.viewDidLoad()
        let sendValue = NetworkManager()
        sendValue.fetchData()
        
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return students.count
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return students.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellEmty = UICollectionViewCell()
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? StudentCollectionViewCell else { return cellEmty }
        let student = students[indexPath.row]
        cell.nameLable.text = student.name
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        ProfileManager.shared.studentNumber = indexPath.row
        let studentData = StudentsData()
        switch studentData.arrayOfStudents[indexPath.row].gender {
        case "м": performSegue(withIdentifier: "showProfile", sender: nil)
        case "ж": performSegue(withIdentifier: "showFeMaleProfile", sender: nil)
        default:
            performSegue(withIdentifier: "myProfile", sender: nil)
        }
    }
}
