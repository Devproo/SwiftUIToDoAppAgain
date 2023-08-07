//
//  Contact.swift
//  SwiftUIToDoAppAgain
//
//  Created by ipeerless on 07/08/2023.
//

import RealmSwift

class Contact: Object {
    
       @Persisted(primaryKey: true) var id: ObjectId
       @Persisted var firstname = ""
       @Persisted var lastname = ""
    
   convenience init( firstName: String , lastName: String) {
         self.init()
        self.firstname = firstName
        self.lastname = lastName
    }
    static var tempData: [Contact] = [
        Contact(firstName: "Adam", lastName: "Moh"),
        Contact(firstName: "Adam1", lastName: "Moh1")
        
        
    ]
}
