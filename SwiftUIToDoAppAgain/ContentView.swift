//
//  ContentView.swift
//  SwiftUIToDoAppAgain
//
//  Created by ipeerless on 07/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State private  var contactArray: [Contact] = []
    var body: some View {
        
        NavigationView {
            List{
                ForEach(0..<contactArray.count, id: \.self) { index in
                    ContactCell(contact: contactArray[index])
                    
                        .swipeActions {
                            Button {
                                DatabaseHelper.shared.deleteContact(contact: contactArray[index])
                                contactArray.remove(at: index)
                                
                            } label: {
                                Text("Delete")
                            }
                            .tint(.red)
                            
                        }
                        .swipeActions {
                            Button {
                                openAlert(isAdd: false, index: index)
                            } label: {
                                Text("Update")
                            }
                            .tint(.indigo)
                            
                        }
                }
            }
            .navigationTitle("Contacts")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        openAlert(isAdd: true)
                    }label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .onAppear{
                contactArray = DatabaseHelper.shared.getAllContacts()
            }
        }
    }
}


extension ContentView {
    func openAlert(isAdd: Bool, index: Int = 0){
       
        let alertController = UIAlertController(
            
            title: isAdd ?  "Add Contact" : "Update Contact",
            message: isAdd ?  "Please enter your contact details" : "Please update your contact details", preferredStyle: .alert)
        alertController.addTextField {
            firstNameField in
            firstNameField.placeholder = isAdd ?  "Enter your first name" : contactArray[index].firstname
        }
        alertController.addTextField {
            lastNameField in
            lastNameField.placeholder = isAdd ?  "Enter your last name" : contactArray[index].lastname
            
        }
        let save = UIAlertAction(title: isAdd ?  "Save" : "Update", style: .default) { _ in
            if let firstName = alertController.textFields?.first?.text,
               let lastName = alertController.textFields?[1].text{
                let contact = Contact(firstName: firstName, lastName: lastName)
                if isAdd {
                    contactArray.append(contact)
                    DatabaseHelper.shared.addContact(contact: contact)
                }else {
                   
                    DatabaseHelper.shared.updateContact(oldContact: contactArray[index], newContact: contact)
                    contactArray[index] = contact
                }
               
            }
        }
        alertController.addAction(save)
        UIApplication.shared.keyWindow?.rootViewController?
            .present(alertController, animated: true)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
