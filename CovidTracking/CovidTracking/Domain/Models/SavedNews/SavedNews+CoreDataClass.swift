//
//  SavedNews+CoreDataClass.swift
//  
//
//  Created by Tiến on 5/26/21.
//
//

import Foundation
import CoreData

@objc(SavedArticles)
public class SavedArticles: NSManagedObject {

}

extension SavedArticles {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedArticles> {
        return NSFetchRequest<SavedArticles>(entityName: "SavedArticles")
    }

    @NSManaged public var title: String?
    @NSManaged public var descripton: String?
    @NSManaged public var publishTime: String?
    @NSManaged public var imageUrl: String?
    @NSManaged public var articlesUrl: String?
}
