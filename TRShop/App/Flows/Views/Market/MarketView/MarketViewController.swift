//
//  MarketViewController.swift
//  TRShop
//
//  Created by Nail Safin on 17.03.2021.
//

import UIKit

class MarketViewController: UIViewController {
    //MARK: Propirties
    let marketView: MarketView = {
        return $0
    }(MarketView())
    var delegate: MarketViewDelegate?
    let requestFactory: RequestFactory
    var user: User
    // MARK: Init
    init(requestfactory: RequestFactory, user: User) {
        self.requestFactory = requestfactory
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureNavigationBar()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view = marketView
        
        
    }
    
    
    //MARK: - Handlers
    
    @objc func openMenu() {
        delegate?.menuButtonToggle(menuOption: nil)
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "gradient2"), for: .default)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.title = "TEST FOR TEST"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "sidebar.leading")?.withTintColor(.white, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(openMenu))
    }
    // MARK: - Navigation
    
    
    
}
    //MARK: - Extensions
