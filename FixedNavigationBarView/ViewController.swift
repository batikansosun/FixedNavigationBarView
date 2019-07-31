//
//  ViewController.swift
//  FixedNavigationBarView
//
//  Created by Batıkan Sosun on 28.07.2019.
//  Copyright © 2019 Batıkan Sosun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var fixedNavigationBarView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        FixedNavigationBarView(title: "Title", containerView: self.fixedNavigationBarView)
        
        _ = FixedNavigationBarView(title: "Title", containerView: self.fixedNavigationBarView, hideRightMenu: true)
        
        _ = FixedNavigationBarView(title: "Title", containerView: self.fixedNavigationBarView, backButtonCompletion: {
            // some custom actions
        }, homeButtonCompletion: {
            // some custom actions
        })
    }



}


var topMostVC: UIViewController? {
    var presentedVC = UIApplication.shared.keyWindow?.rootViewController
    while let pVC = presentedVC?.presentedViewController {
        presentedVC = pVC
    }
    
    if presentedVC == nil {
        print("not found presented vc")
    }
    return presentedVC
}
