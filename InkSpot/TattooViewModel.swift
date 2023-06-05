//
//  TattooViewModel.swift
//  InkSpot
//
//  Created by Lori Rothermel on 6/4/23.
//

import Foundation

class TattooViewModel: ObservableObject {
    @Published var tattoos: [Tattoo] = []
    
    init() {
        loadData()
    }
    
    func saveTattoo(tattoo: Tattoo) {
        if tattoo.id == nil {     // This is a new tattoo to append. Create an id first.
            var newTattoo = tattoo
            newTattoo.id = UUID().uuidString
            tattoos.append(newTattoo)
        } else {   // This is an existing friend we're editing. Find the index to update w/friend.
            if let index = tattoos.firstIndex(where: { $0.id == tattoo.id }) {
                tattoos[index] = tattoo
            }  // if let
        }  // if
        saveData()
    }  // saveFriend
    
    
    func deleteTattoo(atOffsets: IndexSet) {
        tattoos.remove(atOffsets: atOffsets)
        saveData()
    }
    
    
    func moveTattoo(fromOffsets: IndexSet, toOffsets: Int) {
        tattoos.move(fromOffsets: fromOffsets, toOffset: toOffsets)
        saveData()
    }
    
    
    private func saveData() {
        let path = URL.documentsDirectory.appending(component: "tattoo")
        
        let data = try? JSONEncoder().encode(tattoos)
        do {
            try data?.write(to: path)
        } catch {
            print("❗️ERROR: Unable to save data. \(error.localizedDescription)")
        }  // do...catch
    }  // saveData
    
    
    private func loadData() {
        let path = URL.documentsDirectory.appending(component: "tattoo")
        
        guard let data = try? Data(contentsOf: path) else {
            print("❗️ERROR: Unable to read data from path \(path).")
            return
        }  // guard let
        
        do {
            tattoos = try JSONDecoder().decode([Tattoo].self, from: data)
        } catch {
            print("❗️ERROR: Unable to decode data. \(error.localizedDescription)")
        }  // do...catch
        
    }  // loadData
    
    
    
}

