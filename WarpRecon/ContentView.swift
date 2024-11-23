//
//  ContentView.swift
//  WarpRecon
//
//  Created by Michael Fusaro on 11/23/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                NavigationLink(destination: RosterInputView()) {
                    Text("KYE")
                        .font(.title)
                        .padding()
                        .frame(minWidth: 200)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .navigationTitle("WarpRecon")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
