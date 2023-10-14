//  Person.swift
//  SwiftDataDemoApplication
//  Created by Holger Hinzberg on 14.10.23.

import Foundation
import SwiftData

@Model
public class Person  : Identifiable {
    
    public var firstName = ""
    public var lastName = ""
    public var age = ""
    
    init(firstName: String = "", lastName: String = "", age: String = "") {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
}
