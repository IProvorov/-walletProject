//
//  AnimationButton.swift
//  ClassRoom
//
//  Created by Igor Provorov on 3/20/20.
//  Copyright © 2020 Vadim Zhuk. All rights reserved.
//
import Foundation
import UIKit

extension NavigationViewController {
    @objc func buttonClicked() {
            switch numberAnimation % 2 {
            case 0:
                firstAnimation()
            case 1:
                secondAnimation()
            default:
                print("empty")
            }
        }
    func initButton() {
        animationButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    func firstAnimation() {
        animationWidth.constant = 100
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 2.5,
                       options: .curveEaseIn,
                       animations: { [weak self] in
                        guard let self = self else {return}
                        self.numberAnimation += 1
                        self.animationButton.backgroundColor = .red
                        self.view.layoutIfNeeded()
            }, completion: nil)
    }
    func secondAnimation() {
        UIView.animate(withDuration: 1, delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 2.0,
                       options: .curveEaseOut,
                       animations: { [weak self] in
                        guard let self = self else {return}
                        self.animationButton.layer.cornerRadius = self.animationHeight.constant
                        self.animationButton.backgroundColor = .black
                        self.numberAnimation += 1
            }, completion: nil)
    }
}
