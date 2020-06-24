//
//  OffShoreData+CoreDataProperties.swift
//  OffShoresTask
//
//  Created by Sainath MAC on 03/04/1942 Saka.
//  Copyright © 1942 Sainath MAC. All rights reserved.
//
//

import Foundation
import CoreData


extension OffShoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OffShoreData> {
        return NSFetchRequest<OffShoreData>(entityName: "OffShoreData")
    }

    @NSManaged public var data: String?
    @NSManaged public var id: String?
    @NSManaged public var name: String?

}
