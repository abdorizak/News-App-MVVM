//
//  Extentions.swift
//  News App MVVM
//
//  Created by Abdirizak Hassan on 1/6/23.
//

import UIKit
import ProgressHUD

extension UIView {
    
    func addSubViews(_ views: UIView...) {
        for i in views {
            addSubview(i)
        }
    }
}


extension UIViewController {
    
    func Showloading(_ msg: String) {
        ProgressHUD.show(msg)
        ProgressHUD.animationType = .multipleCirclePulse
        ProgressHUD.colorAnimation = .lightGray
    }
    
    
    func dismissLoading() {
        ProgressHUD.dismiss()
    }
    
}

