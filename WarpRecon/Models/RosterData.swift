import Foundation

struct RosterData {
    let armyName: String
    let armySize: Int
    let armyFaction: String
    let detachment: String?
    let battleSize: String?
    let units: [Unit]
}

struct Unit: Identifiable {
    let id = UUID()
    let name: String
    let category: String
    let datasheetId: String
    let wahaLink: String
} 