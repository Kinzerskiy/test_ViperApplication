//
//  AddUserAddUserViewOutput.swift
//  ios_test_app
//
//  Created by n.polovnikova on 19/07/2023.
//  Copyright © 2023 none. All rights reserved.
//

import Foundation
import ViperArch

protocol AddUserViewOutput: ModuleInput, AddUserModuleInput {
    
    func viewIsReady()
    func saveUser(user: User)
    func userSavedSuccessfully()
    func userSaveError()
}
