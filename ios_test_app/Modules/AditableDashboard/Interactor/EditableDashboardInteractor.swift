//
//  DashboardDashboardInteractor.swift
//  ios_test_app
//
//  Created by n.polovnikova on 19/07/2023.
//  Copyright © 2023 none. All rights reserved.
//

import Foundation
import CoreData

final class EditableDashboardInteractor: EditableDashboardInteractorInput {
    
    weak var output: EditableDashboardInteractorOutput?
    
    var persons: [Persons] = []
    
    func refreshData() {
        output?.refreshData(with: persons)
    }
    
    func fetchPersons() {
        persons = CoreDataManager.shared.fetchPersons()
        output?.personsFetched(persons)
    }
}
