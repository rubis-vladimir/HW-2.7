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
    let photo: String
    
    var fullname: String {
        "\(surname) \(name)"
    }
}

class DataManager {
    var arrayOfName: [String] = ["Klark", "Alexandr", "Lev", "James", "Oleg", "Adam"]
    var arrayOfSurname: [String] = ["Smith", "Pauls", "Ivanov", "Batchelor", "Wilson", "Astashenko"]
    var arrayOfEmail: [String] = ["strawberry@mail.ru", "just_smile@yandex.ru", "1.2.3.4.5@mail.ru", "bond77@mail.ru", "capitan45@mail.ru", "men-u@gmail.com"]
    var arrayOfPhone: [String] = ["75-30-82", "889-33-25", "26-02-22", "7-332-62-22", "55-43-11" ,"111-22-33"]
    var arrayOfPhoto: [String] = ["person 1", "person 2", "person 3", "person 4", "person 5", "person 6"]
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
            let randomPhoto = dataManager.arrayOfPhoto.randomElement() ?? ""
            if let index = dataManager.arrayOfPhoto.firstIndex(of: randomPhoto) {
                dataManager.arrayOfPhoto.remove(at: index)
            }
            
            let newPerson = Person(name: randomName, surname: randomSurname, email: randomEmail, phone: randomPhone, photo: randomPhoto)
            personList.append(newPerson)
        }
        return personList
    }
}

