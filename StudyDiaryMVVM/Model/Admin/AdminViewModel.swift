//
//  AdminViewModel.swift
//  StudyDiaryMVVM
//
//  Created by Артем Орлов on 15.11.2022.
//

import Foundation

// MARK: - AdminViewModelInferface
protocol AdminViewModelInferface: AnyObject {
    func listButtonTapped()
    func evaluationsButtonTapped()
    func lessonsButtonTapped()
}

// MARK: - AdminViewModel
class AdminViewModel {

    weak var view: AdminViewControllerInterface?
    private weak var output: AdminOutput?

    init(output: AdminOutput) {
        self.output = output
    }
}

// MARK: - AdminViewModelInferface
extension AdminViewModel: AdminViewModelInferface {
    func listButtonTapped() {
        output?.showListStudents()
    }

    func evaluationsButtonTapped() {

    }

    func lessonsButtonTapped() {

    }

}
