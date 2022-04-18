import Foundation

let calendar = Calendar.current
let x1 = Date()
let x2 = calendar.date(byAdding: .day, value: -1, to: x1)!
let x3 = calendar.date(byAdding: .day, value: -1, to: x2)!
let x4 = calendar.date(byAdding: .day, value: -1, to: x3)!
let x5 = calendar.date(byAdding: .day, value: -1, to: x4)!
let x6 = calendar.date(byAdding: .day, value: -1, to: x5)!

let x7 = calendar.date(byAdding: .hour, value: -1, to: x4)!
let x8 = calendar.date(byAdding: .hour, value: -2, to: x4)!
let x9 = calendar.date(byAdding: .hour, value: -3, to: x2)!
let x10 = calendar.date(byAdding: .hour, value: -4, to: x2)!


var dates = [Date]()
dates.append(x1)
dates.append(x5)
dates.append(x9)
dates.append(x6)
dates.append(x3)

let array = dates.sorted { $0 > $1 }
var dateSequence = [Date]()

for (prev, next) in zip(array, array.dropFirst()) {
    let numberOfDays = calendar.dateComponents([.day], from: calendar.startOfDay(for: next), to: calendar.startOfDay(for: prev))
    if numberOfDays.day! == 1 {
        dateSequence.isEmpty ? dateSequence.append(contentsOf: [prev, next]) : dateSequence.append(next)
        print(dateSequence)
    } else {
        break
    }
}

print("Hurray! You have completed tasks \(dateSequence.count) days in a row")
print(dateSequence)
