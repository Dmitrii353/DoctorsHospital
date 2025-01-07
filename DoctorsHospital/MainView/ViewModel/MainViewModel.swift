//
//  MainViewModel.swift
//  DoctorsHospital
//
//  Created by Дима Люфт on 02.01.2025.
//

import SwiftUI

    
    class MainViewModel:ObservableObject {
        @Published var selectedType: SortedType = .price
        @Published var isAscending: Bool = false
        @Published var listDoctors: [User] = []
        @Published var filteredDoctors: [User] = []
        @Published var searchText: String = "" {
            didSet {
                searchDoctor()
            }
        }
        
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
                self.filteredDoctors = listDoctors
              
            } catch {
                print("Failed to load or decode JSON: \(error.localizedDescription)")
                return 
            }
        }
        
        func searchDoctor() {
            if searchText.isEmpty {
                    filteredDoctors = listDoctors
                } else {
                    filteredDoctors = listDoctors.filter { user in
                        let fullName = [
                            user.firstName?.lowercased() ?? "",
                            user.lastName?.lowercased() ?? "",
                            user.patronymic?.lowercased() ?? ""
                        ].joined(separator: " ")
                        
                        return fullName.lowercased().contains(searchText.lowercased())
                    }
                }
        }
        
        func sortDoctors() {
                switch selectedType {
                case .price:
                    filteredDoctors.sort {
                        isAscending ? ($0.videoChatPrice ?? 0) < ($1.videoChatPrice ?? 0) : ($0.videoChatPrice ?? 0) > ($1.videoChatPrice ?? 0)
                    }
                case .senority:
                    filteredDoctors.sort {
                        isAscending ? $0.workExperience.count < $1.workExperience.count : $0.workExperience.count > $1.workExperience.count
                    }
                case .rating:
                    filteredDoctors.sort {
                        isAscending ? ($0.ratings.first?.value ?? 0 < $1.ratings.first?.value ?? 0) : ($0.ratings.first?.value ?? 0 > $1.ratings.first?.value ?? 0)
                    }
                }
            }
        
        func toggleSortOrder() {
            isAscending.toggle()
            sortDoctors()
        }
    }

