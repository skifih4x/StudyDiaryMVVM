//
//  StudentsUseCase.swift
//  StudyDiaryMVVM
//
//  Created by Артем Орлов on 16.11.2022.
//

import Foundation

// MARK: - StudentsUseCase
protocol StudentsUseCase {
    func getAllStudents() -> [Student]
}

// MARK: - StudentsUseCaseImpl

class StudentsUseCaseImpl {
    init() {}
}

// MARK: - StudentsUseCase

extension StudentsUseCaseImpl: StudentsUseCase {
    func getAllStudents() -> [Student] {
        [
            Student(name: "Den", lastName: "Danilin", startDate: Date()),
            Student(name: "Yana", lastName: "Yspehove", startDate: Date()),
            Student(name: "Artem", lastName: "Orlov", startDate: Date()),
            Student(name: "Andrey", lastName: "Golovah", startDate: Date())
        ]
    }
}
