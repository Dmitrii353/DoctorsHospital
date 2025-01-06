//
//  DoctorsHospitalApp.swift
//  DoctorsHospital
//
//  Created by Дима Люфт on 30.12.2024.
//

import SwiftUI

@main

struct DoctorsHospitalApp: App {
    init() {
        // Настройка цвета фона для UITabBar
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor.white
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
