//
//  DetailView.swift
//  InkSpot
//
//  Created by Lori Rothermel on 6/4/23.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var tattooVM: TattooViewModel
    
    @State var tattoo: Tattoo
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Description:")
                .bold()
            TextField("description", text: $tattoo.description)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom)
            
            Divider()
            
            HStack {
                Text("Location:")
                    .bold()
                
                Spacer()
                
                Picker("", selection: $tattoo.location) {
                    ForEach(Location.allCases, id: \.self) { location in
                        Text("\(location.emoji()) \(formatPicker(location: location))")
                            .tag(location)
                    }  // ForEach
                }  // Picker
            }  // HStack
                        
            Divider()
            
            Text("Notes:")
                .bold()
            TextField("Notes", text: $tattoo.notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom)
                    
            Spacer()
            
        }  // VStack
        .font(.title2)
        .padding()
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }  // Button
            }  // ToolbarItem
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    tattooVM.saveTattoo(tattoo: tattoo)
                    dismiss()
                }  // Button
            }  // ToolbarItem
            
            
        }  // .toolbar
                
    }  // some View
    
    func formatPicker(location: Location) -> String {
        let formattingString = location.rawValue.replacingOccurrences(of: "_", with: " ")
        return formattingString.capitalized
    }
    
    
}  // DetailView



struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(tattoo: Tattoo(description: "Anchor", location: .left_arm, notes: "This is the same anchor used in my yacht. My yacht is very cool, and it is a peaceful place, so this tat reminds me to be calm. And that I'm rich!"))
                .environmentObject(TattooViewModel())
        }
        
    }
}
