//
//  MainViewModel.swift
//  DoctorsHospital
//
//  Created by Дима Люфт on 02.01.2025.
//

import SwiftUI

    
    class MainViewModel:ObservableObject {
        @Published  var listDoctors: [User] = []
        var searchText: String = ""
        
        func loadUsersFromJSON()  {
            guard let url = Bundle.main.url(forResource: "655b754e0574da7622c94aa4", withExtension: "json") else {
                print("Failed to locate users.json in bundle.")
                return
            }
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let users = try decoder.decode(Response.self, from: data)
                self.listDoctors = users.record.data.users
              
            } catch {
                print("Failed to load or decode JSON: \(error.localizedDescription)")
                return 
            }
        }
    }

