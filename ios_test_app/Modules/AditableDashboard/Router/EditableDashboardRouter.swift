//
//  DashboardDashboardRouter.swift
//  ios_test_app
//
//  Created by n.polovnikova on 19/07/2023.
//  Copyright © 2023 none. All rights reserved.
//

import Foundation
import ViperArch

final class EditableDashboardRouter: EditableDashboardRouterInput {
    
    weak var transitionHandler: ModuleTransitionHandler?
    var interactor: EditableDashboardInteractorInput?
    
    func openAddUserModule() {
        transitionHandler?.openModuleUsingSegue(withIdentifier: "AddUser").thenChain(using: { (moduleInput) -> ModuleOutput? in
            if let moduleInput = moduleInput as? AddUserModuleInput {
                moduleInput.configure()
            }
            return nil
        })
    }
}
