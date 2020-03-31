//
//  NavigationViewController.swift
//  ClassRoom
//
//  Created by Igor Provorov on 2/9/20.
//  Copyright © 2020 Vadim Zhuk. All rights reserved.
//

import UIKit

class NavigationViewController: UIViewController {
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var testButton: UIButton!
    @IBOutlet weak var lessonButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var animationButton: UIButton!
    @IBOutlet weak var animationWidth: NSLayoutConstraint!
    @IBOutlet weak var animationHeight: NSLayoutConstraint!
    var login: String = ""
    var isMyProfile = Bool()
    var loginName = ""
    var numberAnimation = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = loginName
        testButton.isEnabled = false
        initButton()
    }
    override func viewWillAppear(_ animated: Bool) {
        isMyProfile = false
    }
    @IBAction func myProfileClick(_ sender: Any) {
        isMyProfile = true
        performSegue(withIdentifier: "myProfile", sender: sender)
    }
    @IBAction func lessonClick(_ sender: Any) {
        //performSegue(withIdentifier: "testOrLesson", sender: sender)
        guard let vc = storyboard?.instantiateViewController(identifier: "CollectionViewController") else {return}
               navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func testClick(_ sender: Any) {
        //  isTest = true
        performSegue(withIdentifier: "testOrLesson", sender: sender)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "myProfile",
            let nextViewController = segue.destination as? MyProfileViewController {
            nextViewController.title = profileButton.titleLabel?.text
            nextViewController .isMyProfile = isMyProfile
        }
       // if segue.identifier == "testOrLesson" ,
         //   let destinationVC = segue.destination as? LessonOrTestViewController {
          //  destinationVC.title = "Other Profile"
      //  }
    }
}
