//
//  MainTabsViewController.swift
//  GastuDiceLog
//
//  Created by Gastón Sobrevilla on 23/10/2020.
//

import Foundation
import UIKit

class MainTabsViewController: UITabBarController {
    
    // Controllers
    private var addEntryVC: UIViewController?
    private var logListVC: UIViewController?
    private var logStatsVC: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupViewControllers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTitle()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    private func setupViewControllers() {
        
        // Add Entry
        let vc1 = NewRollEntryRouter.instantiateNewRollEntryViewController()
        vc1.tabBarItem.title = "Manual Entry"
        vc1.tabBarItem.image = UIImage(systemName: "plus")
        addEntryVC = vc1
        
        let vc2 = ResultsLogRouter.instantiateResultsLogListViewController()
        vc2.tabBarItem.title = "History"
        vc2.tabBarItem.image = UIImage(systemName: "list.dash")
        logListVC = vc2
        
        let vc3 = ResultsLogStatsViewController.instantiateFromStoryboard()
        vc3.tabBarItem.title = "Stats"
        vc3.tabBarItem.image = UIImage(systemName: "chart.bar.fill")
        logStatsVC = vc3
        
        viewControllers = [vc1, vc2, vc3]
    }
    
    private func updateTitle() {
        if selectedViewController === addEntryVC {
            title = "Manual entry"
        }
        if selectedViewController === logListVC {
            title = "History"
        }
        if selectedViewController === logStatsVC {
            title = "Stats"
        }
    }
}

extension MainTabsViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        updateTitle()
    }
}
