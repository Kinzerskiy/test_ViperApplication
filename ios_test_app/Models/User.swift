//
//  User.swift
//  test_mvvm
//
//  Created by Mac Pro on 19.07.2023.
//

import Foundation
import UIKit

struct User: Hashable, Decodable {
    
    var username: String
    var avatarStringURL: String?
    var id: Int
    let dateBirthday: String
    let city: String
    let info: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
    
    enum Section: Int, CaseIterable {
        case users
        func description(usersCount: Int) -> String {
            switch self {
            case .users:
                return "\(usersCount)"
            }
        }
    }
    
    func contains(filter: String?) -> Bool {
        guard let filter = filter else { return true }
        if filter.isEmpty { return true }
        let lowercasedFilter = filter.lowercased()
        return username.lowercased().contains(lowercasedFilter)
    }
}
