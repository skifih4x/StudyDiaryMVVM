//
//  Assembly.swift
//  StudyDiaryMVVM
//
//  Created by Артем Орлов on 15.11.2022.
//

import UIKit

class Assembly {

    func makeAdmin(output: AdminOutput) -> UIViewController {
        let viewModel = AdminViewModel(output: output)
        let view = AdminViewController(viewModel: viewModel)
        viewModel.view = view

        return view
    }
}
