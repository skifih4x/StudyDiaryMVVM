//
//  ListStudentsViewModel.swift
//  StudyDiaryMVVM
//
//  Created by Артем Орлов on 15.11.2022.
//

import Foundation

// MARK: - ListStudentsViewModelInterface

protocol ListStudentsViewModelInterface: AnyObject {
    var tableData: [(section: String, rows: [StudentTableViewCellModel])] { get }

    func viewDidLoad()
}

// MARK: - ListStudentsViewModel

class ListStudentsViewModel {

    weak var view: ListStudentsViewModelInterface?
    private weak var output: ListStudentsOutput?
    private let useCase: StudentsUseCase
    var tableData = [(section: String, rows: [StudentTableViewCellModel])]()

    init(output: ListStudentsOutput, useCase: StudentsUseCase) {
        self.output = output
        self.useCase = useCase
    }
}

// MARK: - ListStudentsViewModelInterface

extension ListStudentsViewModel: ListStudentsViewModelInterface {

    func viewDidLoad() {
        tableData = Dictionary(grouping: useCase.getAllStudents()) {
            $0.lastName.first ?? "*"
        }.compactMap {
                (section: String($0.key), rows: $0.value.compactMap { student in
                  let diff = Calendar.current.dateComponents([.year], from: student.startDate, to: Date()).day ?? 0
                  return  StudentTableViewCellModel(
                        title: "\(student.lastName) \(student.name)",
                        subTitle: "Курс: \(diff + 1)"
                    )
                })
            }
        tableData = tableData.sorted(by: {
            $0.section < $1.section
        })
    }
}
