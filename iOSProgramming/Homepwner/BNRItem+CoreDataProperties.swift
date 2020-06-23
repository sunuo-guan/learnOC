//
//  BNRItem+CoreDataProperties.swift
//  Homepwner
//
//  Created by 关智豪 on 2020/6/22.
//  Copyright © 2020 guanzhihao. All rights reserved.
//
//

import Foundation
import CoreData


extension BNRItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BNRItem> {
        return NSFetchRequest<BNRItem>(entityName: "BNRItem")
    }

    @NSManaged public var itemName: String?
    @NSManaged public var serialNumber: String?
    @NSManaged public var dateCreated: Date?
    @NSManaged public var itemKey: String?
    @NSManaged public var thumbnail: NSObject?
    @NSManaged public var assetType: BNRAssetType?

}
