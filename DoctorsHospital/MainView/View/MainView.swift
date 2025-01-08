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


struct UserCardView: View {
    @State var user: User
    var body: some View {
        NavigationLink(destination: PersonalCardDoctor(dataDoctors: user)) {
        VStack(alignment: .leading, spacing: 10) {
            // Верхняя строка с аватаром, именем и кнопкой избранного
            HStack {
                if let avatar = user.avatar, let url = URL(string: avatar) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                    }
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(Color.gray.opacity(0.9))
                }
                
                
                // Имя врача
                VStack(alignment: .leading, spacing: 5) {
                    Text(user.lastName ?? "Неизвестно")
                        .font(.system(size: 16,weight: .bold))
                    Text("\(user.firstName ?? "") \(user.patronymic ?? "") ")
                        .font(.system(size: 16,weight: .bold))
                }
                
                
                Spacer()
                
                
                // Кнопка избранного
                Button {
                    user.isFavorite?.toggle()
                } label: {
                    Image(systemName: user.isFavorite == true ? "heart.fill" : "heart")
                        .foregroundStyle(Color.red)
                        .font(.title2)
                }
            }
            HStack {
                VStack(alignment: .leading,spacing: 10) {
                    // Рейтинг
                    StarRating(rating: user.ratings.first?.value ?? 0)
                    // Дополнительная информация: специализация, опыт
                    Text("\(user.specialization.first?.name ?? "Педиатр") · стаж \(user.workExperience.count) лет")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                    Text("от \(user.videoChatPrice ?? 0) ₽")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal,60)
            
            
            
            //}
            // Кнопка записи
            Button(action: {
                // Обработка кнопки записи
            }) {
                Text((user.nearestReceptionTime != nil) ? "Записаться" : "Нет свободного расписания")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(user.nearestReceptionTime != nil ? Color.pearchPink : Color.gray)
                    .cornerRadius(8)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(8)
        .frame(maxWidth: .infinity)
    }
    }
}

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
