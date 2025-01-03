//
//  File.swift
//  DoctorsHospital
//
//  Created by Дима Люфт on 01.01.2025.
//

import Foundation

// Структура данных пользователей
struct UserData: Decodable {
    let users: [User]
}

// Структура пользователя
struct User: Decodable {
    let firstName: String
    let lastName: String
    let genderLabel: String
    let specialization: [Specialization]
    let ratings: [Rating]
    let ratingsRating: Double
    let seniority: Int
    let textChatPrice: Int
    let videoChatPrice: Int
    let homePrice: Int
    let hospitalPrice: Int
    let avatar: String?
    let nearestReceptionTime: Int?
    let freeReceptionTime: [String]
    let educationTypeLabel: String?
    let higherEducation: [HigherEducation]
    let workExperience: [WorkExperience]
    let advancedTraining: [AdvancedTraining]
    let rank: Int
    let rankLabel: String
    let scientificDegree: Int
    let scientificDegreeLabel: String
    let category: Int
    let categoryLabel: String
    let isFavorite: Bool
}

// Специализация
struct Specialization: Decodable {
    let id: Int
    let name: String
    let isModerated: Bool
}

// Рейтинг
struct Rating: Decodable {
    let id: Int
    let name: String
}

// Высшее образование
struct HigherEducation: Decodable {
    let id: Int
    let university: String
    let specialization: String
    let qualification: String
    let startDate: Int
    let endDate: Int
    let untilNow: Bool
    let isModerated: Bool
}

// Опыт работы
struct WorkExperience: Decodable {
    let id: Int
    let organization: String
    let position: String
    let startDate: Int
    let endDate: Int?
    let untilNow: Bool
    let isModerated: Bool
}

// Повышение квалификации
struct AdvancedTraining: Decodable {
    let id: Int
    let course: String
    let institution: String
    let startDate: Int
    let endDate: Int?
    let isModerated: Bool
}
