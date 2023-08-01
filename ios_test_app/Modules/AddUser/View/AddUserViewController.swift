//
//  AddUserAddUserViewController.swift
//  ios_test_app
//
//  Created by n.polovnikova on 19/07/2023.
//  Copyright © 2023 none. All rights reserved.
//

import UIKit
import CoreData

final class AddUserViewController: UIViewController, AddUserViewInput {
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var infoTextView: UITextView!
    
    var output: AddUserViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewIsReady()
    }
    
    func setupInitialState() {
        
    }
    
    @IBAction func saveAction(_ sender: Any) {
        guard let fullName = fullNameTextField.text, !fullName.isEmpty,
              let city = cityTextField.text, !city.isEmpty,
              let info = infoTextView.text, !info.isEmpty else {
            showAlert()
            return
        }
        
        let date = datePicker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLL, MM yyyy"
        let dateString = dateFormatter.string(from: date)
        
        CoreDataManager.shared.createPerson(fullName: fullName, city: city, info: info, birthday: dateString)
        output?.userSavedSuccessfully()
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "error", message: "please fill all info", preferredStyle: .actionSheet)
        alert.addAction(.init(title: "Candel", style: .cancel))
        self.present(alert, animated: true)
    }
}

