//
//  DashboardDashboardInteractorOutput.swift
//  ios_test_app
//
//  Created by n.polovnikova on 19/07/2023.
//  Copyright © 2023 none. All rights reserved.
//

import Foundation

protocol DashboardInteractorOutput: AnyObject {
    
    func refreshData(with users: [User]) 
}
