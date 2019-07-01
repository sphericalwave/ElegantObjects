//
//  SWTheme.swift
//  FoodSearch
//
//  Created by Aaron Anthony on 2018-05-30.
//  Copyright © 2018 SphericalWave. All rights reserved.
//

import UIKit

struct SWBlue {
    
    static var opaque: UIColor { return #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1) } //lighter
    static var translucent: UIColor { return #colorLiteral(red: 0.06274509804, green: 0.2941176471, blue: 0.8980392157, alpha: 1) }
    
}

struct SWTheme {
    
    func configure() {
        configureNavBar()
        //configureStatusBar()
        configureSearchBar()
        configureSegmentedControls()
        configureBackButtons()
    }
    
    func configureNavBar() {
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.tintColor = uicolorFromHex(rgbValue: 0xffffff)   //dunno
        navigationBarAppearace.barTintColor = SWBlue.opaque //bar background color
        
        // change navigation item title color
        navigationBarAppearace.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
//    func configureStatusBar() {
//        //Set "View controller-based status bar appearance" = NO in info.plist
//        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
//        UIViewController.shared.preferredStatusBarStyle  =
//    }
    
    func configureSearchBar() {
        UISearchBar.appearance().tintColor = .white
        //UISearchBar.appearance().backgroundColor = SWBlue.opaque
        //UISearchBar.appearance().tintColor = SWBlue.opaque

        
//        UITextField.appearance(whenContainedInInstancesOf: [UISearchController.self]).backgroundColor = .white
//        UITextField.appearance(whenContainedInInstancesOf: [UISearchController.self]).tintColor = .black
    }
    
    func configureSegmentedControls() {
        UISegmentedControl.appearance().tintColor = .white
        UISegmentedControl.appearance().backgroundColor = .clear //SWBlue.opaque
    }
    
    func configureBackButtons() {
        //Hide Back Button Text because i don't care
//        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.clear], for: .normal)
    }

    func uicolorFromHex(rgbValue:UInt32)->UIColor{
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
    }
}
