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
        setupNavigationBar()
        setupViewControllers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTitle()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    private func setupNavigationBar() {
        let button = UIBarButtonItem(title: "Reset data", style: .plain, target: self, action: #selector(resetTapped))
        navigationItem.rightBarButtonItem = button
    }
    
    private func setupViewControllers() {
        
        let vc0 = UIViewController()
        vc0.view.backgroundColor = .white
        vc0.tabBarItem.title = "Roll"
        vc0.tabBarItem.image = UIImage(systemName: "die.face.6")
        
        let vc1 = NewRollEntryRouter.instantiateNewRollEntryViewController()
        vc1.tabBarItem.title = "Manual Entry"
        vc1.tabBarItem.image = UIImage(systemName: "plus")
        addEntryVC = vc1
        
        let vc2 = ResultsLogRouter.instantiateListVC()
        vc2.tabBarItem.title = "History"
        vc2.tabBarItem.image = UIImage(systemName: "list.dash")
        logListVC = vc2
        
        let vc3 = ResultsLogRouter.instantiateStatsVC()
        vc3.tabBarItem.title = "Stats"
        vc3.tabBarItem.image = UIImage(systemName: "chart.bar.fill")
        logStatsVC = vc3
        
        let vc4 = UIViewController()
        vc4.view.backgroundColor = .white
        vc4.tabBarItem.title = "Settings"
        vc4.tabBarItem.image = UIImage(systemName: "gearshape")
        
        viewControllers = [vc0, vc1, vc2, vc3, vc4]
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
    
    @objc private func resetTapped() {
        let alert = UIAlertController(title: "Are you sure you want to reset the data?", message: "This will clear the rolls history and stats", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Reset", style: .destructive, handler: { (_) in
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension MainTabsViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        updateTitle()
    }
}
