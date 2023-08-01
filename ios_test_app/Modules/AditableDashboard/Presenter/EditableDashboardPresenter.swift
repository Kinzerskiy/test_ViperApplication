//
//  DashboardDashboardPresenter.swift
//  ios_test_app
//
//  Created by n.polovnikova on 19/07/2023.
//  Copyright © 2023 none. All rights reserved.
//

import Foundation
import ViperArch

final class EditableDashboardPresenter: ModuleInput, EditableDashboardModuleInput, EditableDashboardViewOutput, EditableDashboardInteractorOutput {
    
    weak var view: EditableDashboardViewInput?
    var interactor: EditableDashboardInteractorInput?
    var router: EditableDashboardRouterInput?
    
    internal func viewIsReady() {
        view?.setupInitialState()
        interactor?.fetchPersons()
    }
    
    
    func refresh() {
        interactor?.fetchPersons()
    }
    
    func refreshData(with persons: [Persons]) {
        interactor?.refreshData()
    }
    
    func personsFetched(_ persons: [Persons]) {
        view?.refreshData(with: persons)
    }
    
    func personsFetchFailed() {
        
    }
    
    func set(moduleOutput: ModuleOutput) {
        
    }
    
    func configure() {
    }
    
    func openAddUser() {
        router?.openAddUserModule()
    }
}
