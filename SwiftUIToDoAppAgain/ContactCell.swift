//
//  ContactCell.swift
//  SwiftUIToDoAppAgain
//
//  Created by ipeerless on 07/08/2023.
//

import SwiftUI

struct ContactCell: View {
   var contact: Contact
    
    var body: some View {
        VStack {
            Text(contact.firstname)
                .font(.headline)
            Text(contact.lastname)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

struct ContactCell_Previews: PreviewProvider {
    static var previews: some View {
        ContactCell(contact: Contact.tempData.first!)
    }
}
