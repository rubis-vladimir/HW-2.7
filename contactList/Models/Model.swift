//
//  Model.swift
//  contactList
//
//  Created by Владимир Рубис on 10.06.2021.
//

struct Person {
    let name: String
    let surname: String
    let email: String
    let phone: String
    
    var fullname: String {
        "\(surname) \(name)"
    }
}

class DataManager {
    var arrayOfName: [String] = ["Klark", "Alexandr", "Lev"]
    var arrayOfSurname: [String] = ["Smith", "Pauls", "Ivanov"]
    var arrayOfEmail: [String] = ["123@mail.ru", "456@mail.ru", "789@mail.ru"]
    var arrayOfPhone: [String] = ["75-30-82", "889-33-25", "26-02-22"]
}

extension Person {
    
    static func getPersonList() -> [Person] {
        var personList = [Person]()
        let dataManager = DataManager()
        
        for _ in 0..<dataManager.arrayOfName.count {
            let randomName = dataManager.arrayOfName.randomElement() ?? ""
            if let index = dataManager.arrayOfName.firstIndex(of: randomName) {
                dataManager.arrayOfName.remove(at: index)
            }
            let randomSurname = dataManager.arrayOfSurname.randomElement() ?? ""
            if let index = dataManager.arrayOfSurname.firstIndex(of: randomSurname) {
                dataManager.arrayOfSurname.remove(at: index)
            }
            let randomEmail = dataManager.arrayOfEmail.randomElement() ?? ""
            if let index = dataManager.arrayOfEmail.firstIndex(of: randomEmail) {
                dataManager.arrayOfEmail.remove(at: index)
            }
            let randomPhone = dataManager.arrayOfPhone.randomElement() ?? ""
            if let index = dataManager.arrayOfPhone.firstIndex(of: randomPhone) {
                dataManager.arrayOfPhone.remove(at: index)
            }
            
            let newPerson = Person(name: randomName, surname: randomSurname, email: randomEmail, phone: randomPhone)
            personList.append(newPerson)
        }
        return personList
    }
}
