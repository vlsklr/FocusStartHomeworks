//
//  MainApp.swift
//  homework-1
//
//  Created by user188734 on 4/17/21.
//


class MainApp
{
    var cars: [Car]
    
    init(cars: [Car]){
        self.cars = cars
    }
    
    func start() {
        print("Меню")
        print("1 - Добавить авто")
        print("2 - Вывод списка")
        print("3 - Сортировать по кузову")
        if let menuItem = Int(readLineCarData(txt: "Выберете пункт меню")){
            switch menuItem {
            case 1:
                self.append()
            case 2:
                self.showCars()
            case 3:
                self.filterCars()
            default:
                return
            }
        }
    }
    
    func append() {
        let manufacturer = readLineCarData(txt: "Введите производителя")
        let model = readLineCarData(txt: "Введите модель")
        Car.Body.printBodytype()
        guard let bodyType = Int(readLineCarData(txt: "Выберете тип кузова из списка:")), let selectedBody = Car.Body(rawValue: bodyType) else {
            print("Выбран некорректный тип кузова")
            return
        }
        let year = readLineCarData(txt: "Введите год выпуска")
        let number = readLineCarData(txt: "Введите номер авто")
        let newCar = Car(manufacturer: manufacturer, model: model, bodyType: selectedBody, yearOfIssue: year, carNumber: number)
        cars.append(newCar)
        return self.start()
    }
    
    func showCars() {
        for car in cars {
            printCar(car)
        }
        return self.start()
    }
    
    func filterCars(){
        Car.Body.printBodytype()
        guard let bodyType = Int(readLineCarData(txt: "Выберете тип кузова из списка:")), let selectedBody = Car.Body(rawValue: bodyType) else {
            print("Выбран некорректный тип кузова")
            return self.start()
        }
        for car in cars {
            if car.bodyType == selectedBody {
                printCar(car)
            }
        }
        return self.start()
    }
    
    func printCar(_ car: Car) {
        print("____________")
        print("Марка : \(car.manufacturer)")
        print("Модель : \(car.model)")
        print("Тип кузова : \(car.bodyType)")
        if let year = car.yearOfIssue, !year.isEmpty{
            print("Год выпуска : \(year)")
        } else {
            print("Год выпуска : -")
        }
        if let number = car.carNumber {
            if number != "" {
                print("Гос номер : \(number)")
            }
        }
    }
    
    func readLineCarData(txt: String) -> String {
        print(txt)
        if let input = readLine() {
            return input
        }
        print("Ошибка ввода, попробуйте еще раз")
        return self.readLineCarData(txt: txt)
    }
}
