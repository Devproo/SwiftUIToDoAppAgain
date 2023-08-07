//
//  DatabaseHelper.swift
//  SwiftUIToDoAppAgain
//
//  Created by ipeerless on 07/08/2023.
//


import RealmSwift
import Foundation


class DatabaseHelper{
    
    static let shared = DatabaseHelper()
    
    private var realm = try! Realm()
    
    init(){
        print(databaseURL() as Any)
        }
        
    func databaseURL() -> URL?{
           return realm.configuration.fileURL
       }
    
    func addContact(contact: Contact){
            try! realm.write({
                realm.add(contact)
            })
        }
    func updateContact(oldContact: Contact, newContact: Contact) {
        try! realm.write({
            oldContact.firstname = newContact.firstname
            oldContact.lastname = newContact.lastname
        })
    }
    func deleteContact(contact: Contact) {
        try! realm.write({
            realm.delete(contact)
        })
    }
    
    func getAllContacts() -> [Contact] {
        return Array(realm.objects(Contact.self))
    }
    
    
}
