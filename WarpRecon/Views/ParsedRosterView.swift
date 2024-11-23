import SwiftUI

struct ParsedRosterView: View {
    let rosterText: String
    @State private var parsedData: RosterData?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                if let data = parsedData {
                    // Army Info
                    VStack(alignment: .leading, spacing: 10) {
                        Text(data.armyName)
                            .font(.title)
                            .bold()
                        
                        Text("Points: \(data.armySize)")
                        Text("Faction: \(data.armyFaction)")
                        if let detachment = data.detachment {
                            Text("Detachment: \(detachment)")
                        }
                        if let battleSize = data.battleSize {
                            Text("Battle Size: \(battleSize)")
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // Units Table
                    VStack(spacing: 0) {
                        // Table Header
                        HStack {
                            Text("Unit Name")
                            Spacer()
                            Text("Type")
                            Spacer()
                            Text("Actions")
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        
                        // Table Rows
                        ForEach(data.units) { unit in
                            UnitRow(unit: unit)
                        }
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding()
                } else {
                    ProgressView()
                        .onAppear {
                            // Parse roster text here
                            parseRoster()
                        }
                }
            }
        }
        .navigationTitle("Parsed Roster")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func parseRoster() {
        // Implement roster parsing logic here
        // This should convert the rosterText into a RosterData object
    }
}

struct UnitRow: View {
    let unit: Unit
    
    var body: some View {
        HStack {
            Text(unit.name)
            Spacer()
            Text(unit.category)
            Spacer()
            HStack(spacing: 10) {
                Link("Datasheet", destination: URL(string: unit.wahaLink) ?? URL(string: "https://wahapedia.ru")!)
                    .foregroundColor(.blue)
                
                NavigationLink("Datacard") {
                    UnitCardView(datasheetId: unit.datasheetId)
                }
            }
        }
        .padding()
        .background(Color.white)
    }
}

#Preview {
    NavigationStack {
        ParsedRosterView(rosterText: "Sample roster text")
    }
} 
