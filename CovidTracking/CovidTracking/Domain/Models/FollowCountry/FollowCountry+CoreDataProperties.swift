//
//  FollowCountry+CoreDataProperties.swift
//  
//
//  Created by Tiến on 5/20/21.
//
//

import Foundation
import CoreData

extension FollowCountry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FollowCountry> {
        return NSFetchRequest<FollowCountry>(entityName: "FollowCountry")
    }

    @NSManaged public var name: String?

}
