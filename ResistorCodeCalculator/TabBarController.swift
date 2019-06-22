//
//  TabBarController.swift
//  ResistorCodeCalculator
//
//  Created by Five Admin on 6/21/19.
//  Copyright © 2019 Five Admin. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstViewController = Resistor6Controller()
        firstViewController.tabBarItem = UITabBarItem(title: "6 BANDS", image: nil, tag: 0)
        
        let secondViewController = Resistor5Controller()
        secondViewController.tabBarItem = UITabBarItem(title: "5 BANDS", image: nil, tag: 1)
        
        let thirdViewController = ResistorController()
        thirdViewController.tabBarItem = UITabBarItem(title: "4 BANDS", image: nil, tag: 2)
        
        let fourthViewController = FavoritesController()
        fourthViewController.tabBarItem = UITabBarItem(title: "FAVORITES", image: nil, tag: 2)
        
        
        let fifthViewController = SettingsController()
        fifthViewController.tabBarItem = UITabBarItem(title: "INSTRUCTIONS", image: nil, tag: 2)
        
        let tabBarList = [fifthViewController, firstViewController, secondViewController, thirdViewController, fourthViewController]
        
        viewControllers = tabBarList
        
    }
    
    
}
