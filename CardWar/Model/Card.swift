//
//  Card.swift
//  CardWar
//
//  Created by Vincent Grossier on 02/07/2022.
//

struct Card {
    
    init(family: Family, value: Value) {
        self.family = family
        self.value = value
    }
    
    enum Family: CaseIterable, CustomStringConvertible {
        case clubs
        case diamonds
        case hearts
        case spades
        
        var description: String {
            switch self {
            case .clubs: return "♣️"
            case .diamonds: return "♦️"
            case .hearts: return "♥️"
            case .spades: return "♠️"
            }
        }
    }
    
    enum Value: Int, CaseIterable, CustomStringConvertible {
        case ace = 14
        case two = 2
        case three = 3
        case four = 4
        case five = 5
        case six = 6
        case seven = 7
        case height = 8
        case nine = 9
        case ten = 10
        case jack = 11
        case queen = 12
        case king = 13
        
        var description: String {
            switch self {
            case .ace: return "1️⃣"
            case .two: return "2️⃣"
            case .three: return "3️⃣"
            case .four: return "4️⃣"
            case .five: return "5️⃣"
            case .six: return "6️⃣"
            case .seven: return "7️⃣"
            case .height: return "8️⃣"
            case .nine: return "9️⃣"
            case .ten: return "🔟"
            case .jack: return "💂🏼‍♂️"
            case .queen: return "👸🏻"
            case .king: return "🤴🏼"
            }
        }
    }
    
    private let family: Family
    private let value: Value
}

// MARK: - Comparable

extension Card: Comparable {
    
    static func < (lhs: Card, rhs: Card) -> Bool {
        lhs.value.rawValue < rhs.value.rawValue
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        lhs.value.rawValue == rhs.value.rawValue
    }
}

// MARK: - CustomStringConvertible

extension Card: CustomStringConvertible {
    
    var description: String {
        "| \(value.description)\(family.description) |"
    }
}
