//
//  ViewExt+Pin.swift
//  TRShop
//
//  Created by Nail Safin on 11.03.2021.
//

import Foundation
import UIKit
import PinLayout

extension UIView {
    public func pin(to addView: UIView) -> PinLayout<UIView> {
        if !addView.subviews.contains(self) {
            addView.addSubview(self)
        }
        return self.pin
    }
}
