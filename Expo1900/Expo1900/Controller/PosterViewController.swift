//
//  Expo1900 - PosterViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class PosterViewController: UIViewController {
    private let posterView = PosterView()
    
    // MARK: - ViewLifeCycle
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
    
    // MARK: - Methods
    func setupMainView() {
//        posterView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            posterView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            posterView.topAnchor.constraint(equalTo: view.topAnchor),
//            posterView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            posterView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
        posterView.frame = view.bounds
        posterView.enterButton.addTarget(self, action: #selector(enterButtonDidTapped(_:)), for: .touchUpInside)
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
