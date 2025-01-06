//
//  ContentView.swift
//  DoctorsHospital
//
//  Created by Дима Люфт on 30.12.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var notificationCount: Int = 1
    var body: some View {
            TabView {
                    Tab("Главная", systemImage: "house") {
                        MainView()
                    }
                    
                    Tab("Приемы", systemImage: "calendar") {
                        ReceptionView()
                    }
                    Tab("Чат", systemImage: "message") {
                        ChatView()
                    }
                    .badge(notificationCount)
            
                    Tab("Профиль", systemImage: "person.fill") {
                        ProfileView()
                    }
                }
            .tint(Color.pearchPink)
        }
     
        
    
    
}

#Preview {
    ContentView()
}
