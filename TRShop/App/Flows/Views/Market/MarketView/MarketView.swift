//
//  MarketView.swift
//  TRShop
//
//  Created by Nail Safin on 17.03.2021.
//

import UIKit
import PinLayout

class MarketView: UIView {

    let backgroundView: UIView = {
        $0.backgroundColor = .black
        let backgroundImage: UIImageView = {
            $0.image = UIImage(named: "gradient2")
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFill
            $0.backgroundColor = .black
            $0.frame = CGRect(x: 0, y: 0, width: 1600, height: 1200)
        
            return $0
        }(UIImageView())
        $0.addSubview(backgroundImage)
        $0.bringSubviewToFront(backgroundImage)
        return $0
    }(UIView())
    
    override func layoutSubviews() {
        super.layoutSubviews()
        marketLayouts()
    }
    func marketLayouts() {
       
        self.backgroundColor = .black
        backgroundView.pin(to: self)
            .all()
    }
}
