//
//  AplicacionMapaApp.swift
//  Shared
//
//  Created by Luciano Nicolini on 30/05/2022.
//

import SwiftUI

@main
struct AplicacionMapaApp: App {
    @StateObject private  var vm = LocationViewModel()
    var body: some Scene {
        WindowGroup {
            LocationView()
                .environmentObject(vm)
        }
    }
}
