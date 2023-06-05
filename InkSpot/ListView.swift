//
//  ListView.swift
//  InkSpot
//
//  Created by Lori Rothermel on 6/4/23.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject private var tattooVM: TattooViewModel
    @State private var isSheetPresented = false
    
    
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(tattooVM.tattoos) { tattoo in
                    NavigationLink {
                        DetailView(tattoo: tattoo)
                    } label: {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(tattoo.location.emoji())
                                Text(tattoo.description)
                            }  // HStack
                            Text(tattoo.notes)
                                .font(.title3)
                                .italic()
                                .lineLimit(1)
                        }  // VStack
                        
                            
                    }  // NavigationLink
                }  // ForEach
                .onDelete(perform: tattooVM.deleteTattoo)
                .onMove(perform: tattooVM.moveTattoo)
                .font(.title)
            }  // List
            .navigationTitle("Tattoo")
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }  // ToolbarItem
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isSheetPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }  // Button
                }  // ToolbarItem
            }  // .toolbar
        }  // NavigationStack
        .sheet(isPresented: $isSheetPresented) {
            NavigationStack {
                DetailView(tattoo: Tattoo())
            }  // NavigationStack
        }  // .sheet
    }  // some View
}  // ListView

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(TattooViewModel())
    }
}
