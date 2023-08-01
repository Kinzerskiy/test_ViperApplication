//
//  ApplicationAssembly.swift
//  Yaskrava
//
//  Created by Vlad Zhulavskyi on 08.12.2021.
//  Copyright © 2021 ideil. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

fileprivate var assembler: Assembler!

extension SwinjectStoryboard {
    
    @objc
    class func setup() {
        Container.loggingFunction = nil
        
        let assemblies: [Assembly] = [
            DashboardAssembly(),
            EditableDashboardAssembly(),
            AddUserAssembly()
        ]
        assembler = Assembler(assemblies, container: defaultContainer)
    }
}
