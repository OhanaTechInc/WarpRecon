import SwiftUI

struct RosterInputView: View {
    @State private var rosterText: String = ""
    @State private var showParsedRoster: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Enter Your Roster")
                .font(.title)
                .padding(.top)
            
            TextEditor(text: $rosterText)
                .frame(height: 300)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding()
            
            NavigationLink(destination: ParsedRosterView(rosterText: rosterText), isActive: $showParsedRoster) {
                Button(action: {
                    showParsedRoster = true
                }) {
                    Text("Submit")
                        .font(.title2)
                        .padding()
                        .frame(minWidth: 200)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            
            Spacer()
        }
        .navigationTitle("Roster Input")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        RosterInputView()
    }
} 