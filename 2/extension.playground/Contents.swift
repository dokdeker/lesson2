import UIKit

extension String {
    func readed(book: String){
        print("""
        Книга "\(book)" была прочитана
        """)
    }
    func started(book: String){
        print("""
        Начато чтение книги "\(book)"
        """)
    }
    func buyed(book: String){
        print("""
            Книга "\(book)" куплена
            """)
    }
}


var book:String

book = "Колобок"
book.started(book: book)

book = "Красная шапочка"
book.buyed(book: book)

book = "Исследования атомных и молекулярных процессов"
book.readed(book: book)
