//
//  DashboardDashboardPresenter.swift
//  ios_test_app
//
//  Created by n.polovnikova on 19/07/2023.
//  Copyright © 2023 none. All rights reserved.
//

import Foundation
import ViperArch

final class DashboardPresenter: ModuleInput, DashboardModuleInput, DashboardViewOutput, DashboardInteractorOutput {
    
    weak var view: DashboardViewInput?
    var interactor: DashboardInteractorInput?
    var router: DashboardRouterInput?
    
    internal func viewIsReady() {
        view?.setupInitialState()
        print("viewIsReady")
        interactor?.refreshData()
    }
    
    func set(moduleOutput: ModuleOutput) {
        
    }
    
    func configure() {
        
    }
    
    
    func refreshData(with users: [User]) {
        view?.refreshData(with: users)
    }
}
