//
//  Expo1900 - MainViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    private var mainView: MainView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
        designateNavigationSetting()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        AppUtility.lockOrientation(.all)
    }
    
    func setupMainView() {
        mainView = MainView(self)
        mainView?.enterButton.addTarget(self, action: #selector(enterButtonDidTapped(_:)), for: .touchUpInside)
    }
    
    func designateNavigationSetting() {
        self.navigationItem.title = "메인"
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @objc func enterButtonDidTapped(_ sender: UIButton) {
        let itemTableViewController = ItemTableViewController()
        self.navigationController?.pushViewController(itemTableViewController, animated: true)
    }
}
