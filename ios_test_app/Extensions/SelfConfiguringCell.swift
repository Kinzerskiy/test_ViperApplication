//
//  SelfConfiguringCell.swift
//  test_mvvm
//
//  Created by Mac Pro on 19.07.2023.
//

import UIKit

protocol SelfConfiguringCell {
    static var reusedId: String { get }
    func configure<U: Hashable>(with value: U)
}
