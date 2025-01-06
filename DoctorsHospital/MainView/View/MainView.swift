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
                    HStack(spacing: 0) {
                        ForEach(SortedType.allCases, id: \.self) { sorting in
                            Button {
                                //
                            } label: {
                                Text(sorting.title)
                                    .font(.custom("Montserrat-Regular", size: 14))
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical,10)
                                    .clipped()
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 0)
                                    .stroke(Color(.systemGray6), lineWidth: 0.5))
                            .background(Color(.pearchPink))
                        }
                        
                    }
                    .clipShape(.rect(cornerRadius: 8))
                    
                    
                    
                }
                .padding()
                .onAppear {
                    vm.loadUsersFromJSON()
                }
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
                            ForEach(vm.listDoctors) { user in
                                UserCardView(user: user)
                                    .padding(.horizontal,30)
                            }
                        }
                    }
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
        .searchable(text: $vm.searchText, prompt: "Поиск")
                    
        
    }
        }
    }


#Preview {
    MainView()
}


struct UserCardView: View {
    @State var user: User
    
    var body: some View {
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
                    Text(user.firstName ?? "Неизвестно")
                        .font(.headline)
                    Text("\(user.lastName ?? "") \(user.patronymic ?? "") ")
                        .font(.headline)
                    
                    // Рейтинг
//                    HStack(spacing: 2) {
//                        ForEach(0..<5) { index in
//                            Image(systemName: index < user.rating ? "star.fill" : "star")
//                                .resizable()
//                                .frame(width: 12, height: 12)
//                                .foregroundStyle(Color.pink)
//                        }
//                    }
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
            
            // Дополнительная информация: специализация, опыт
            VStack(alignment: .leading, spacing: 5) {
                Text("\(user.specialization.first?.name ?? "Педиатр") · стаж \(user.workExperience.count) лет")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Text("от \(user.videoChatPrice ?? 0) ₽")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }
            
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
        .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
        .frame(maxWidth: .infinity)
    }
}
