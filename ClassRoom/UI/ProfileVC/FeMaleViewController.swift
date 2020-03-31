//
//  FeMaleViewController.swift
//  ClassRoom
//
//  Created by Igor Provorov on 3/13/20.
//  Copyright © 2020 Vadim Zhuk. All rights reserved.
//

import UIKit

class FeMaleViewController: UIViewController {
    @IBOutlet weak var myProfileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sureNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    var selectedProfile = [Profile]()
    var isMyProfile = Bool()
    var studentNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        ProfileManager.shared.studentDataForProfile(studentNumber: ProfileManager.shared.studentNumber)
        nameLabel.text =  ProfileManager.shared.name
        sureNameLabel.text = ProfileManager.shared.surname
        ageLabel.text = ProfileManager.shared.age
        genderLabel.text = "female"
    }
}
