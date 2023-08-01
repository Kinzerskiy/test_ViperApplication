//
//  DashboardDashboardInteractor.swift
//  ios_test_app
//
//  Created by n.polovnikova on 19/07/2023.
//  Copyright © 2023 none. All rights reserved.
//

import Foundation

final class DashboardInteractor: DashboardInteractorInput {
    
    weak var output: DashboardInteractorOutput?
    
    var users: [User] = Bundle.main.decode([User].self, from: "users.json")
    
    func refreshData() {
        output?.refreshData(with: users)
    }
}
