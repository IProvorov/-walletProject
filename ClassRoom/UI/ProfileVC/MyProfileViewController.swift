//
//  MyProfileViewController.swift
//  ClassRoom
//
//  Created by Igor Provorov on 2/9/20.
//  Copyright © 2020 Vadim Zhuk. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController {
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
        self.myProfileImage.layer.cornerRadius = self.myProfileImage.bounds.size.width / 2.0
        self.myProfileImage.clipsToBounds = true
        nameLabel.text = "Igor"
        sureNameLabel.text = "Provorov"
        ageLabel.text = "27"
        genderLabel.text = "Male"
    }
}
