//
//  InkSpotApp.swift
//  InkSpot
//
//  Created by Lori Rothermel on 6/4/23.
//

import SwiftUI

@main
struct InkSpotApp: App {
    @StateObject var tattooVM = TattooViewModel()
    
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(tattooVM)
        }
    }
}
