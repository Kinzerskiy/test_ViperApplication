//
//  UserTableViewCell.swift
//  ios_test_app
//
//  Created by Mac Pro on 20.07.2023.
//

import UIKit
import CoreData

class UserTableViewCell: UITableViewCell {
    
    static let reusedId = String.init(describing: UserTableViewCell.self)
    
    @IBOutlet weak var birthday: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var info: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }
    
    func fill(with model: Persons) {
        userName.text = model.userName
        city.text = model.city
        info.text = model.info
        birthday.text =  model.birthday
    }
}
