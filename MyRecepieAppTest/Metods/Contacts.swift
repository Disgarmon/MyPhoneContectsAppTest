//
//  Contacts.swift
//  MyRecepieAppTest
//
//  Created by Daniil Lebedev on 22.07.2022.
//

import Foundation

struct Contact{
   
    let firstName: String
    let lastName: String
    let phoneNumber: String
    let mail: String
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    var rows: [String] {
        [phoneNumber, mail]
    }
}

extension Contact {
    static func getContact() -> [Contact]{
        
        var contacts: [Contact] = []
        
        let firstNames = DataStore.shared.names.shuffled()
        let lastNames = DataStore.shared.surnames.shuffled()
        let phoneNumbers = DataStore.shared.phones.shuffled()
        let mails = DataStore.shared.emails.shuffled()
        
        let iterationCount = min(
            firstNames.count,
            lastNames.count,
            mails.count,
            phoneNumbers.count
        )
        for index in 0..<iterationCount {
            let contact = Contact(
                firstName: firstNames[index],
                lastName: lastNames[index],
                phoneNumber: phoneNumbers[index],
                mail: mails[index]
            )
            
            contacts.append(contact)
        }
        return contacts
    }
}
