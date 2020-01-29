class Grocery {
    var name: String
    var desc: String
    var count: Int
    enum ItemType {
        case produce, meats, dairy, bakery, frozen, cold, other
    }
    var category: ItemType
    var price: Double
    
    init (name: String, desc: String = "", count: Int = 0, category: ItemType = .other, price: Double) {
        self.name = name
        self.desc = desc
        self.count = count
        self.category = category
        self.price = price
    }
    
    func getTotalPrice() -> Double {
        return (price * Double(count))
    }
}

var oldMilk = Grocery(name: "Dutch Lady Milk", desc: "1.5L milk", count: 10, category: .dairy, price: 13.0)
print ("Name of oldMilk is \(oldMilk.name)")
var newMilk = oldMilk
print ("Name of newMilk is \(newMilk.name)")

newMilk.name = "Dairy Farm Milk"
print ("Name of oldMilk is \(oldMilk.name)")
print ("Name of newMilk is \(newMilk.name)")

extension Grocery {
    func describe() {
        print ("""
            name:\t\t\t\(name)
            description:\t\(desc)
            count:\t\t\t\(count)
            price:\t\t\t\(price)
            """)
    }
}

oldMilk.describe()
/*--------------------------------------------------*/

struct Book {
    var name: String
    var count: Int
    var borrowed: Int = 0
    var on_shelf: Int {count - borrowed}
    enum Genre {
        case comic, romance, sci_fi, travel, art, health, other
    }
    var category: Genre = .other
}

class Library {
    var listOfBooks: [Book] = []
    
    init (listOfBooks: [Book]) {
        self.listOfBooks = listOfBooks
    }
    
    func addBook (_ book: Book) {
        listOfBooks.append(book)
    }
    
    func delBook (name: String) {
        if let index = listOfBooks.firstIndex(where: {$0.name == name}) {
            listOfBooks.remove(at: index)
        }
    }
    
    func borrowBook (name: String) -> Bool {
        if let index = listOfBooks.firstIndex(where: {$0.name == name}) {
            if listOfBooks[index].count > listOfBooks[index].borrowed {
                listOfBooks[index].borrowed += 1
                return true
            }
            else {
                return false
            }
        }
        else {
            return false
        }
    }
    
    func returnBook (name: String) -> Bool {
        if let index = listOfBooks.firstIndex(where: {$0.name == name}) {
            if listOfBooks[index].borrowed != 0 {
                listOfBooks[index].borrowed -= 1
                return true
            }
            else {
                return false
            }
        }
        else {
            return false
        }
    }
    
    func reportBook (name: String) {
        if let index = listOfBooks.firstIndex(where: {$0.name == name}) {
            print ("""
                name:\t\t\t\(listOfBooks[index].name)
                count:\t\t\t\(listOfBooks[index].count)
                borrowed:\t\t\(listOfBooks[index].borrowed)
                on shelf:\t\t\(listOfBooks[index].on_shelf)
                
                """)
        }
    }
}

var booksToAdd: [Book] = []
booksToAdd.append (Book(name: "Eat Vege", count: 6, category: .health))
booksToAdd.append (Book(name: "Ironman", count: 10, category: .comic))
booksToAdd.append (Book(name: "Travelling in Hong Kong", count: 3, category: .travel))

var mainLibrary = Library (listOfBooks: booksToAdd)
mainLibrary.borrowBook(name: "Ironman")
mainLibrary.borrowBook(name: "Ironman")

mainLibrary.reportBook(name: "Ironman")

mainLibrary.returnBook(name: "Ironman")
mainLibrary.reportBook(name: "Ironman")
