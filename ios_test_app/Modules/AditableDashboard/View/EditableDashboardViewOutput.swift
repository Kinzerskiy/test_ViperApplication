//
//  DashboardDashboardViewOutput.swift
//  ios_test_app
//
//  Created by n.polovnikova on 19/07/2023.
//  Copyright © 2023 none. All rights reserved.
//

import Foundation
import ViperArch

protocol EditableDashboardViewOutput: ModuleInput, DashboardModuleInput {
    
    func viewIsReady()
    func refresh()
    func openAddUser()
    
}
