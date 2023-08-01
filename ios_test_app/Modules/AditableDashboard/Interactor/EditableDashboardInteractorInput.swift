//
//  DashboardDashboardInteractorInput.swift
//  ios_test_app
//
//  Created by n.polovnikova on 19/07/2023.
//  Copyright © 2023 none. All rights reserved.
//

import Foundation

protocol EditableDashboardInteractorInput {
    var persons: [Persons] { get set }
    
    func refreshData()
    func fetchPersons()
}
