//
//  MenuViewController.swift
//  TRShop
//
//  Created by Nail Safin on 17.03.2021.
//

import UIKit
private let reuseID = "MenuCell"
class MenuViewController: UIViewController {
    
    let requestFactory: RequestFactory
    var user: User
    var delegate: MarketViewDelegate?
    let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
    let backgroundImage: UIImageView = {
        $0.image = UIImage(named: "gradient")
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
        $0.backgroundColor = .black
        $0.frame = CGRect(x: 0, y: 0, width: 1600, height: 1200)
    
        return $0
    }(UIImageView())
    // MARK: Init
    init(requestfactory: RequestFactory, user: User) {
        self.requestFactory = requestfactory
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        self.view.addSubview(backgroundImage)
        self.view.addSubview(self.tableView)
       
        configureTableView()
        self.updateLayout(with: self.view.frame.size)
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
       super.viewWillTransition(to: size, with: coordinator)
       coordinator.animate(alongsideTransition: { (contex) in
          self.updateLayout(with: size)
       }, completion: nil)
    }
    
    //MARK: - Handlers
    
    func configureTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MenuViewTableViewCell.self, forCellReuseIdentifier: reuseID)
        tableView.backgroundColor = .clear
        tableView.rowHeight = 60
        tableView.isUserInteractionEnabled = true
        tableView.separatorStyle = .none
       
            
    }
    private func updateLayout(with size: CGSize) {
       self.tableView.frame = CGRect.init(origin: .zero, size: size)
    }
    // MARK: - Navigation
    
    
    
}
//MARK: - Extensions
extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as! MenuViewTableViewCell
        let menuOption = MenuOption(rawValue: indexPath.row)
        cell.logoIcon.image = menuOption?.image
        cell.menuOption.text = menuOption?.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuOption = MenuOption(rawValue: indexPath.row)
        delegate?.menuButtonToggle(menuOption: menuOption)
        print ("TAPP")
    }
    
}
