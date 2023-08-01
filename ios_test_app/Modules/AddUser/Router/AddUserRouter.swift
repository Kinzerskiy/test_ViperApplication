//
//  AddUserAddUserRouter.swift
//  ios_test_app
//
//  Created by n.polovnikova on 19/07/2023.
//  Copyright © 2023 none. All rights reserved.
//

import Foundation
import ViperArch

final class AddUserRouter: AddUserRouterInput {
    
    weak var transitionHandler: ModuleTransitionHandler?
    var interactor: AddUserInteractorInput?
    
    func pop() {
        transitionHandler?.closeCurrentModule(animated: true)
    }
}
