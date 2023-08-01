//
//  AddUserAddUserAssembly.swift
//  ios_test_app
//
//  Created by n.polovnikova on 19/07/2023.
//  Copyright © 2023 none. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

final class AddUserAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.storyboardInitCompleted(AddUserViewController.self) { (r, view) in
            view.output = r.resolve(AddUserPresenter.self, argument: view)
        }
        
        container.register(AddUserViewController.self) { r in
            let view = AddUserViewController()
            view.output = r.resolve(AddUserPresenter.self, argument: view)
            return view
        }
        
        container.register(AddUserPresenter.self) { (r, view: AddUserViewController) in
            let presenter = AddUserPresenter()
            let interactor = r.resolve(AddUserInteractor.self, argument: presenter)!
            let router = r.resolve(AddUserRouter.self, arguments: view, interactor)!
            presenter.view = view
            presenter.interactor = interactor
            presenter.router = router
            return presenter
        }
        
        container.register(AddUserInteractor.self) { (r, presenter: AddUserPresenter) in
            let interactor = AddUserInteractor()
            interactor.output = presenter
            return interactor
        }
        
        container.register(AddUserRouter.self) { (r, view: AddUserViewController, interactor: AddUserInteractor) in
            let router = AddUserRouter()
            router.interactor = interactor
            router.transitionHandler = view
            return router
        }
        
    }
    
}
