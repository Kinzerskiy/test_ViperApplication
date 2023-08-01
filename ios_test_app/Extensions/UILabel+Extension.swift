//
//  UILabel+Extension.swift
//  test_mvvm
//
//  Created by Mac Pro on 20.07.2023.
//

import Foundation
import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont? = .arimo()) {
        self.init()
        
        self.text = text
        self.font = font
    }
}
