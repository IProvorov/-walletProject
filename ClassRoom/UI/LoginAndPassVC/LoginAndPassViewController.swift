//
//  LoginAndPassViewController.swift
//  ClassRoom
//
//  Created by Igor Provorov on 2/5/20.
//  Copyright © 2020 Vadim Zhuk. All rights reserved.
//

import UIKit

class LoginAndPassViewController: UIViewController {
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var eyeButton: UIButton!
    let validation = ValidatorManager()
   // var animationView = UIView(frame: CGRect(x:100, y:100, width:100, height: 100))
    override func viewDidLoad() {
        super.viewDidLoad()
       // view.addSubview(animationView)
        loginTextField.placeholder = "Login"
        passwordTextField.placeholder = "Password"
        loginLabel.text = "Login"
        errorLabel.text = ""
    }
   @IBAction func eyeClick (_ sender: Any) {
        if passwordTextField.isSecureTextEntry == true {
            passwordTextField.isSecureTextEntry = false
            eyeButton.setImage(UIImage(named: "ic_Open_Eye"), for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = true
            eyeButton.setImage(UIImage(named: "ic_Close_Eye"), for: .normal)
        }
    }
    @IBAction func logInButtonPushed(_ sender: Any) {
        if validation.isLoginCorrect(login: loginTextField.text ?? "") ==
            true && validation.isPasswordCorrect(password: passwordTextField.text ?? "") ==
            true {
            performSegue(withIdentifier: "LoginWithPass", sender: nil)
        }
    }
    @IBAction func changeLogin(_ sender: Any) {
        if validation.isLoginCorrect(login: loginTextField.text ?? "") == true {
            errorLabel.text = ""
        } else {
            errorLabel.text = "Incorrect login"
        }
    }
    @IBAction func changePassword(_ sender: Any) {
        if validation.isLoginCorrect(login: loginTextField.text ?? "") == true {
            if validation.isPasswordCorrect(password: passwordTextField.text ?? "") == true {
                errorLabel.text = ""
            } else {
                errorLabel.text = "Incorrect password"
            }
        } else {
            errorLabel.text = "Incorrect login"
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? NavigationViewController
        destinationVC?.loginName = ("Welcome, \(loginTextField.text ?? "")")
    }
    
//    var animationView = UIView(frame: CGRect(x: 100, y: 100, width: 150, height: 150))
//        var verticalPosition: NSLayoutConstraint?
//
//        override func viewDidLoad() {
//            super.viewDidLoad()
//            animationView.layer.borderWidth = 3
//            self.view.addSubview(animationView)
//            animationView.translatesAutoresizingMaskIntoConstraints = false
//            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//            verticalPosition = animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//                verticalPosition?.isActive = true
//            animationView.widthAnchor.constraint(equalToConstant: 150).isActive = true
//            animationView.heightAnchor.constraint(equalToConstant: 150).isActive = true
//        }
//
//        override func viewDidAppear(_ animated: Bool) {
//            super.viewDidAppear(animated)
//            animateToCircle()
//
//            UIView.animate(withDuration: 1, animations: { [weak self] in
//                self?.animateToCircle()
//            }) { [weak self] bool in
//                UIView.animate(withDuration: 3) { [weak self] in
//                    guard let self = self else { return }
//                    let view = self.animationView
//                    view.backgroundColor = .yellow
//                }
//            }
//        }
//
//        func animateToCircle() {
//            self.verticalPosition?.constant = -200
//            UIView.animate(withDuration: 1) { [weak self] in
//                guard let self = self else { return }
//                let view = self.animationView
//                view.backgroundColor = .red
//    //            view.center = self.view.center
//                view.layer.cornerRadius = view.bounds.width / 2
//                view.layer.borderColor = UIColor.black.cgColor
//                self.view.layoutIfNeeded()
//            }
//        }
}
