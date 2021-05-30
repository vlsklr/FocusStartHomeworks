//
//  DataModel.swift
//  homework-3
//
//  Created by user188734 on 5/15/21.
//

import Foundation


struct Person {
    let firstName: String
    let secondName: String
    let patronym: String
    let city: String
    let age: String
}

struct DevInfo {
    let iosInfo: String
    let nonIosInfo: String
}

struct Hobbies {
    let typesOfHobbie: [String]
    let valueHobbies: [String]
}

protocol DataModelP {
    var personInfo: Person { get }
    var devInfo: DevInfo { get }
    var hobbieInfo: Hobbies { get }
}

class  DataModel: DataModelP {
    var personInfo: Person
    
    var devInfo: DevInfo
    
    var hobbieInfo: Hobbies
    
    init() {
        self.personInfo = Person(firstName: "Скляров", secondName: "Владислав", patronym: "Александрович", city: "Новосибирск", age: "27")
        self.devInfo = DevInfo(iosInfo: "iOS программированием начал увлекаться осенью 2020, вяло изучая курс от Swiftbook. Вяло, из-за отсутствия дедлайнов, общения с людьми, отсутствием понимания своего уровня и всем остальным таким, влияющим на мотивацию. От Фокус Старта ожидаю максимального прокачивания своих навыков и прихода понимания о том, моё ли разработка или все-таки нет", nonIosInfo: "Программированием начал заниматься в университете, писали на С/С++/С#/Java. После второго курса проходил летнюю школу Элтекса, там большая часть курса была разработка под Android, на тот момент увлекало, но чтобы попасть на собеседование на стажировку возраст оказался маловат(. После этого несколько лет вообще не занимался программированием, до недавнего времени")
        self.hobbieInfo = Hobbies(typesOfHobbie: ["Мои увлечения","Мой любимый вид спорта", "Мое новое увлечение"], valueHobbies: ["Путешествия, спорт, настолки, программирование, книжки, сериальчики, английский, инвестиции в криптовалюты"
, "Хоккей", "Малая авиация ✈️"])
    }
}
