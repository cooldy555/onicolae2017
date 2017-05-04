//
//  Person+CoreDataProperties.swift
//  
//
//  Created by octavian nic on 5/4/17.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person");
    }

    @NSManaged public var name: String?
    @NSManaged public var age: NSDecimalNumber?

    override public var description: String {
        return self.name!
    }
}
