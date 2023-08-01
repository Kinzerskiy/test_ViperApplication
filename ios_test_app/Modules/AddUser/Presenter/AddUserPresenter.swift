//
//  AddUserAddUserPresenter.swift
//  ios_test_app
//
//  Created by n.polovnikova on 19/07/2023.
//  Copyright © 2023 none. All rights reserved.
//

import Foundation
import ViperArch

final class AddUserPresenter: ModuleInput, AddUserModuleInput, AddUserViewOutput, AddUserInteractorOutput {
    
    weak var view: AddUserViewInput?
    var interactor: AddUserInteractorInput?
    var router: AddUserRouterInput?
    
    internal func viewIsReady() {
        view?.setupInitialState()
    }
    
    func userSavedSuccessfully() {
        router?.pop()
    }
    
    func userSaveError() {
        
    }
    
    func set(moduleOutput: ModuleOutput) {
        
    }
    
    func configure() {
        
    }
    
    func saveUser(user: User) {
        self.router?.pop()
    }
}
