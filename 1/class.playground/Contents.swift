import UIKit

class Figure {
    var name: String
    var cornerRadius: Int
    
    init(name: String, cornerRadius: Int) {
        self.name = name
        self.cornerRadius = cornerRadius
    }
    
}

protocol perimeterFigure {
    var weight: Int { get set }
    var height: Int { get set }
    var perimeter: Int { get set }
    func calcPerimeter()
    
}

class Triangle {
    var figure = Figure.init(name: "треугольник", cornerRadius: 0)
}

class Rectangle: perimeterFigure {
    var figure = Figure.init(name: "прямоугольник", cornerRadius: 0)
    var weight = 10
    var height = 6
    var perimeter: Int = 0
    func calcPerimeter() {
        perimeter = (weight + height) * 2
    }
}

class Circle {
    var figure = Figure.init(name: "круг" , cornerRadius: 6)
}

class Parallelogram: perimeterFigure {
    var figure = Figure.init(name: "параллелограмм", cornerRadius: 0)
    var weight = 8
    var height = 12
    var perimeter: Int = 0
    func calcPerimeter() {
        perimeter = (weight + height) * 2
    }
}




var rectangle = Rectangle()
rectangle.calcPerimeter()
print("Длина \(rectangle.figure.name)а = \(rectangle.height)")
print("Ширина \(rectangle.figure.name)а = \(rectangle.weight)")
print("Периметр \(rectangle.figure.name)а = \(rectangle.perimeter)")

print()

var parallelogram = Parallelogram()
parallelogram.calcPerimeter()
print("Длина \(parallelogram.figure.name)а = \(parallelogram.height)")
print("Ширина \(parallelogram.figure.name)а = \(parallelogram.weight)")
print("Периметр \(parallelogram.figure.name)а = \(parallelogram.perimeter)")
