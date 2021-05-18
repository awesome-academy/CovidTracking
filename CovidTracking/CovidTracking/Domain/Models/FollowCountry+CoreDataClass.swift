//
//  FollowCountry+CoreDataClass.swift
//  
//
//  Created by Tiến on 5/19/21.
//
//

import Foundation
import CoreData

@objc(FollowCountry)
public class FollowCountry: NSManagedObject {

}

extension FollowCountry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FollowCountry> {
        return NSFetchRequest<FollowCountry>(entityName: "FollowCountry")
    }

    @NSManaged public var name: String?

}
