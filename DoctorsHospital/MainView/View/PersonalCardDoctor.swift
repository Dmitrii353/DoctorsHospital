//
//  PersonalCardDoctor.swift
//  DoctorsHospital
//
//  Created by Дима Люфт on 08.01.2025.
//

import SwiftUI

struct PersonalCardDoctor: View {
    var dataDoctors: User
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack (alignment: .bottom) {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 20) {
                        if let avatarURL = dataDoctors.avatar, let url = URL(string: avatarURL) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                            } placeholder: {
                                ProgressView()
                            }
                        } else {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .foregroundColor(.gray)
                        }
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text(dataDoctors.firstName ?? "Неизвестно")
                                .font(.custom("Montserrat-Regular", size: 14))
                            Text("\(dataDoctors.lastName ?? "") \(dataDoctors.patronymic ?? "")")
                                .font(.custom("Montserrat-Regular", size: 14))
                        }
                    }
                    
                    HStack(spacing: 10) {
                        Image(systemName: "clock")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20,height: 20)
                            .foregroundStyle(Color.gray.opacity(0.5))
                        Text("Опыт работы: \(dataDoctors.workExperience.count)")
                            .font(.custom("Montserrat-Regular", size: 14))
                            .foregroundStyle(Color.gray.opacity(0.8))
                    }
                    
                    HStack(spacing: 10) {
                        Image(systemName: "gym.bag.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(Color.gray.opacity(0.5))
                        Text(dataDoctors.workExperience.first?.scientificDegreeLabel ?? "Квалификация врача неизвестна")
                            .font(.custom("Montserrat-Regular", size: 16))
                            .foregroundStyle(Color.gray.opacity(0.8))
                    }
                    HStack(spacing: 10) {
                        Image(systemName: "graduationcap")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(Color.gray.opacity(0.5))
                        Text(dataDoctors.higherEducation.first?.university ?? "1-й ММИ им. И.М.Сеченова")
                            .font(.custom("Montserrat-Regular", size: 16))
                            .foregroundStyle(Color.gray.opacity(0.8))
                    }
                    HStack(spacing: 10) {
                        Image(systemName: "mappin.circle.fill")
                            .resizable()
                            .frame(width: 20,height: 20)
                            .foregroundStyle(Color.gray.opacity(0.5))
                        Text(dataDoctors.workExperience.first?.organization ?? "Детская клиника “РебёнОК")
                            .font(.custom("Montserrat-Regular", size: 16))
                            .foregroundStyle(Color.gray.opacity(0.8))
                    }
                    
                    Button {
                        //
                    } label: {
                        HStack {
                            Text("Стоимость услуг")
                                .font(.custom("Montserrat-Regular", size: 16))
                            
                            Spacer()
                            
                            Text("От \(dataDoctors.videoChatPrice ?? 0) ₽")
                                .font(.custom("Montserrat-Regular", size: 16))
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.horizontal,15)
                        .frame(height: 50)
                        .background(Color.white)
                        .clipShape(.rect(cornerRadius: 8))
                        .padding(.top, 20)
                    }
                    
                    Text("Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Даёт рекомендации по диетологии. Доктор имеет опыт работы в России и за рубежом. Проводит консультации пациентов на английском языке.")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal,20)
            }
            .navigationTitle(dataDoctors.specialization.first?.name ?? "Педиатр")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.colorTabView)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.backward") // Стандартная иконка "назад"
                            .foregroundColor(.black) // Измените цвет на желаемый
                    }
                    
                }
            }
            Button(action: {
                //
            }) {
                Text((dataDoctors.nearestReceptionTime != nil)  ? "Записаться" : "Нет свободного времени")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(dataDoctors.nearestReceptionTime != nil ? Color.pearchPink : Color.gray)
                    .cornerRadius(8)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 10)
        }
    }
}
