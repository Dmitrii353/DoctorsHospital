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
struct User: Decodable, Identifiable {
    let id: String
    let slug: String?
    let firstName: String?
    let patronymic: String?
    let lastName: String?
    let gender: String?
    let genderLabel: String?
    let specialization: [Specialization]
    let ratings: [Rating]
    let rankLabel: String?
    let scientificDegreeLabel: String?
    let categoryLabel: String?
    let avatar: String?
    let higherEducation: [Education]
    let workExperience: [WorkExperience]
    let advancedTraining: [AdvancedTraining]
    let videoChatPrice: Int?
    var isFavorite: Bool?
    
    let nearestReceptionTime: TimeInterval?
    
    enum CodingKeys: String, CodingKey {
        case id, slug, firstName = "first_name", patronymic, lastName = "last_name"
        case gender, genderLabel = "gender_label"
        case specialization, ratings
        case rankLabel = "rank_label"
        case scientificDegreeLabel = "scientific_degree_label"
        case categoryLabel = "category_label"
        case avatar, higherEducation = "higher_education"
        case workExperience = "work_expirience"
        case advancedTraining = "advanced_training"
        case videoChatPrice = "video_chat_price"
        case isFavorite = "is_favorite"
        case nearestReceptionTime = "nearest_reception_time"
    }
}

struct Specialization: Decodable {
    let name: String?
    let id: Int
    let isModerated: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case isModerated = "is_moderated"
    }
}

struct Rating: Decodable {
    let id: Int
    let name: String?
    let value: Double?
}

struct Education: Decodable {
    let id: Int
    let university: String?
    let specialization: String?
    let qualification: String?
    let startDate: TimeInterval?
    let endDate: TimeInterval?
    let untilNow: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, university, specialization, qualification
        case startDate = "start_date"
        case endDate = "end_date"
        case untilNow = "until_now"
    }
}

struct WorkExperience: Decodable {
    let id: Int
    let organization: String?
    let position: String?
    let startDate: TimeInterval?
    let endDate: TimeInterval?
    let untilNow: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, organization, position
        case startDate = "start_date"
        case endDate = "end_date"
        case untilNow = "until_now"
    }
}

struct AdvancedTraining: Decodable {
    let id: Int
    let course: String?
    let startDate: TimeInterval?
    let endDate: TimeInterval?
    let untilNow: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, course
        case startDate = "start_date"
        case endDate = "end_date"
        case untilNow = "until_now"
    }
}
