//
//  CoreDataManager.swift
//  CovidTracking
//
//  Created by Tiến on 5/19/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import Foundation
import CoreData

struct CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private init() {}
    
    let context = CoreDataServices.shared.persistentContainer.viewContext
    
    struct FollowCountryManager {
        static let shared = CoreDataManager.FollowCountryManager()
        
        private init() {}
    }
    
}

enum CoreDataError: Error {
    case fetchError
    case addError
    case deleteError
}
