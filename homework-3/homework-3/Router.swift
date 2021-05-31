//
//  Router.swift
//  homework-3
//
//  Created by Vlad on 31.05.2021.
//

import Foundation
import UIKit

class Router {
    private let mainStoryboard: UIStoryboard
    private let tabbar: UITabBarController
    
    private let firstNavigationController: UINavigationController
    private let firstViewController: FirstVC
    
    private let secondNavigationController: UINavigationController
    private let secondViewController: SecondVC
    
    private let thirdNavigationController: UINavigationController
    private let thirdViewController: ThirdVC
    
    //private let popNavigationController: UINavigationController
    //private let popViewController: PopViewController
    
    //private let pushNavigationController: UINavigationController
    //private let pushViewController: PushViewController
    
    init() {
        self.mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        self.tabbar = UITabBarController(nibName: "Main.storyboard", bundle: nil)
        
        self.firstViewController = mainStoryboard.instantiateViewController(withIdentifier: "aboutMe") as! FirstVC
        self.firstNavigationController = UINavigationController(rootViewController: self.firstViewController)
        
        self.secondViewController = mainStoryboard.instantiateViewController(withIdentifier: "devInfo") as! SecondVC
        self.secondNavigationController = UINavigationController(rootViewController: self.secondViewController)
        
        self.thirdViewController = mainStoryboard.instantiateViewController(withIdentifier: "myHobbies") as! ThirdVC
        self.thirdNavigationController = UINavigationController(rootViewController: self.thirdViewController)
        
        self.tabbar.setViewControllers([self.firstNavigationController,
                                        self.secondNavigationController,
                                        self.thirdNavigationController],
                                        animated: true)
        
        
    }
    
    internal func returnController() -> UITabBarController {
        return self.tabbar
    }
}
