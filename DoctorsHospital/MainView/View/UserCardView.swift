//
//  UserCardView.swift
//  DoctorsHospital
//
//  Created by Дима Люфт on 09.01.2025.
//
import SwiftUI

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
                        .foregroundStyle(Color.black)
                    Text("\(user.firstName ?? "") \(user.patronymic ?? "") ")
                        .font(.system(size: 16,weight: .bold))
                        .foregroundStyle(Color.black)

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
