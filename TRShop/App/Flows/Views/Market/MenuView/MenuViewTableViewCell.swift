//
//  MenuViewTableViewCell.swift
//  TRShop
//
//  Created by Nail Safin on 22.03.2021.
//

import UIKit

class MenuViewTableViewCell: UITableViewCell {

    // MARK: - Propities
    
    var menuOption: UILabel = {
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.numberOfLines = 2
        $0.lineBreakMode = .byWordWrapping
        $0.text = "test test"
        return $0
    }(UILabel())
    
    var logoIcon: UIImageView = {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.backgroundColor = .clear
        $0.tintColor = .white
        $0.image = UIImage(systemName: "pencil")
        return $0
    }(UIImageView())
    
    
    // MARK: - Inits
    
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = .clear
    selectionStyle = .none
    
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handlers
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let mv = self.contentView
        logoIcon.pin(to: mv)
            .size(30)
            .topLeft(15)
        menuOption.pin(to: mv)
            .after(of: logoIcon, aligned: .center)
            .marginLeft(20)
            .size(CGSize(width: mv.frame.width - 40, height: mv.frame.height - 20))
        
    }

}
