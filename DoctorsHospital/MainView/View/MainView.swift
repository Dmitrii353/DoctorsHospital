//
//  MainView.swift
//  DoctorsHospital
//
//  Created by Дима Люфт on 06.01.2025.
//

import SwiftUI

struct MainView: View {
    @StateObject var vm = MainViewModel()
 
    let columns = [GridItem(.flexible())]
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    SortView(vm: vm, sortedType: $vm.selectedType) {
                        vm.sortDoctors()
                      
                    }
                    .padding(.horizontal,15)

                }
                .padding(5)
                
                
                VStack {
                    if vm.listDoctors.isEmpty {
                        // Показ индикатора загрузки, пока данные не загружены
                        VStack {
                            ProgressView("Загрузка врачей...")
                                .padding()
                            Spacer()
                        }
                    } else {
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(vm.filteredDoctors) { user in
                                UserCardView(user: user)
                                    .padding(.horizontal,30)
                            }
                        }
                    }
                }
                .onAppear {
                    vm.loadUsersFromJSON()
                }
                .searchable(text: $vm.searchText, prompt: "Поиск")
                .onSubmit(of: .search ) {
                    vm.searchDoctor()
                }
        }
        .background(Color.colorTabView)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Педиатры")
                    .font(.custom("Montserrat-Regular", size: 20))
                
            }
            
        }
       
        
    }
        }
    }


#Preview {
    MainView()
}



// Рейтинг(звёзды)
struct StarRating: View {
    let rating: Double
    var body: some View {
        
        HStack(spacing: 2) {
            ForEach(0..<5) { index in
                Image(systemName: index < Int(rating) ? "star.fill" : "star")
                    .resizable()
                    .frame(width: 12, height: 12)
                    .foregroundStyle(Color.pink)
            }
        }
    }
}
