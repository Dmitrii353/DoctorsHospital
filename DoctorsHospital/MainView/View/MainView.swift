//
//  MainView.swift
//  DoctorsHospital
//
//  Created by Дима Люфт on 06.01.2025.
//

import SwiftUI

struct MainView: View {
    @State var vm = MainViewModel()
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
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
//                            UserCardView(user: user)
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


//struct UserCardView: View {
//    let user: User
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 8) {
//            // Аватар
//            if let avatar = user.avatar, let url = URL(string: avatar) {
//                AsyncImage(url: url) { image in
//                    image
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 100, height: 100)
//                        .clipShape(Circle())
//                } placeholder: {
//                    ProgressView()
//                }
//            } else {
//                Circle()
//                    .fill(Color.gray.opacity(0.5))
//                    .frame(width: 100, height: 100)
//                    .overlay(Text("Нет фото").font(.caption).foregroundColor(.white))
//            }
//
//           //  Имя врача
//            Text("\(user.firstName) \(user.lastName)")
//                .font(.headline)
//                .lineLimit(1)
////
////            // Рейтинг
//            if let rating = user.ratings.count{
//                Text("⭐️ \(String(format: "%.1f", rating))")
//                    .font(.subheadline)
//            }
//
//            // Специализация
//            if let specialization = user.specialization.first {
//                Text("specialization")
//                    .font(.footnote)
//                    .foregroundColor(.gray)
//            }
//
//            // Научная степень
//            if let degree = user.scientificDegreeLabel {
//                Text(degree)
//                    .font(.footnote)
//                    .foregroundColor(.pink)
//            }
//        }
//        .padding()
//        .background(Color(.systemBackground))
//        .cornerRadius(8)
//        .shadow(color: .gray.opacity(0.3), radius: 4, x: 0, y: 2)
//    }
//}
