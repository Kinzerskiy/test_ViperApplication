//
//  DashboardDashboardViewInput.swift
//  ios_test_app
//
//  Created by n.polovnikova on 19/07/2023.
//  Copyright © 2023 none. All rights reserved.
//

import Foundation
import ViperArch

protocol EditableDashboardViewInput: ModuleTransitionHandler {
    
    func setupInitialState()
    
    func refreshData(with persons: [Persons])
}
