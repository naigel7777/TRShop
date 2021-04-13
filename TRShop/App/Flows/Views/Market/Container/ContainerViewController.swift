//
//  ContainerViewController.swift
//  TRShop
//
//  Created by Nail Safin on 17.03.2021.
//

import UIKit

class ContainerViewController: UIViewController {

    //MARK: Propirties

    let requestFactory: RequestFactory
    var user: User
    var menuController: MenuViewController!
    var centerController: UIViewController!
    var isOpened = false
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
        
        configureMarketController()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    override var prefersStatusBarHidden: Bool {
        return isOpened
    }
    
    //MARK: - Handlers
    func configureMarketController() {
        let marketController = MarketViewController(requestfactory: requestFactory, user: user)
        marketController.delegate = self
        centerController = UINavigationController(rootViewController: marketController)
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func configureMenuCotroller() {
        if menuController == nil {
            menuController = MenuViewController(requestfactory: requestFactory, user: user)
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }
    
    func showMenu(shouldShow: Bool, menuoption: MenuOption?) {
        if shouldShow {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = 0
            }) { _ in
                guard let menuOption = menuoption else { return }
                self.didSeelctedMenuOption(menuOption: menuOption)
            }
        }
        animateStatusBar()
    }
    
    func animateStatusBar() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
    
    // MARK: - Navigation
    
    func didSeelctedMenuOption(menuOption: MenuOption) {
        switch menuOption {
  
        case .Profile:
            let userInfoVC = UserInfoViewController(requestfactory: requestFactory, user: user)
            present(userInfoVC, animated: true, completion: nil)
        case .Market:
            print("Mark")
        case .About:
            print("About")
        case .Exit:
            self.dismiss(animated: true) {
                let logOut = self.requestFactory.makeLogOutRequestFactorty()
                logOut.logOut(userID: self.user.id) { response in
                    switch response.result {
                    case .success(let res):
                        print("LOGOUT CallBack = \(res)")
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
               
            }
        }
    }
    
}
//MARK: - Extensions
extension ContainerViewController: MarketViewDelegate {
    func menuButtonToggle(menuOption: MenuOption?) {
        if !isOpened {
           configureMenuCotroller()
        }
        isOpened = !isOpened
        showMenu(shouldShow: isOpened, menuoption: menuOption)
    }
    
 
}


