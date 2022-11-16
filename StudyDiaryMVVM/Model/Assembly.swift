//
//  Assembly.swift
//  StudyDiaryMVVM
//
//  Created by Артем Орлов on 15.11.2022.
//

import UIKit

class Assembly {

    func makeStudentsAssembly() -> StudentsUseCase {
        StudentsUseCaseImpl()
    }

    func makeAdmin(output: AdminOutput) -> UIViewController {
        let viewModel = AdminViewModel(output: output)
        let view = AdminViewController(viewModel: viewModel)
        viewModel.view = view

        return view
    }

    func makeListStudent(output: ListStudentsOutput) -> UIViewController {
        let viewModel = ListStudentsViewModel(output: output, useCase: makeStudentsAssembly())
        let view = ListStudentsViewController(viewModel: viewModel)
        viewModel.view = view as? any ListStudentsViewModelInterface

        return view
    }
}
