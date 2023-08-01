//
//  DashboardDashboardAssembly.swift
//  ios_test_app
//
//  Created by n.polovnikova on 19/07/2023.
//  Copyright © 2023 none. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

final class EditableDashboardAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.storyboardInitCompleted(EditableDashboardViewController.self) { (r, view) in
            view.output = r.resolve(EditableDashboardPresenter.self, argument: view)
        }
        
        container.register(EditableDashboardViewController.self) { r in
            let view = EditableDashboardViewController()
            view.output = r.resolve(EditableDashboardPresenter.self, argument: view)
            return view
        }
        
        container.register(EditableDashboardPresenter.self) { (r, view: EditableDashboardViewController) in
            let presenter = EditableDashboardPresenter()
            let interactor = r.resolve(EditableDashboardInteractor.self, argument: presenter)!
            let router = r.resolve(EditableDashboardRouter.self, arguments: view, interactor)!
            presenter.view = view
            presenter.interactor = interactor
            presenter.router = router
            return presenter
        }
        
        container.register(EditableDashboardInteractor.self) { (r, presenter: EditableDashboardPresenter) in
            let interactor = EditableDashboardInteractor()
            interactor.output = presenter
            return interactor
        }
        
        container.register(EditableDashboardRouter.self) { (r, view: EditableDashboardViewController, interactor: EditableDashboardInteractor) in
            let router = EditableDashboardRouter()
            router.interactor = interactor
            router.transitionHandler = view
            return router
        }
    }
}
