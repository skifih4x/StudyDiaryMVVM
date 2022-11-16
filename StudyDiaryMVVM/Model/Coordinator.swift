//
//  Coordinator.swift
//  StudyDiaryMVVM
//
//  Created by Артем Орлов on 15.11.2022.
//

import UIKit

class Coordinator {

    private let assembly: Assembly

    private var navigationViewController: UINavigationController?

    init(assembly: Assembly) {
        self.assembly = assembly
    }

    func start(window: UIWindow) {
        let adminView = assembly.makeAdmin(output: self)
        navigationViewController = UIVideoEditorController(rootViewController: adminView)
        window.rootViewController = navigationViewController
        window.makeKeyAndVisible()
    }
}

// MARK: - AdminOutput

extension Coordinator: AdminOutput {
    func showListStudents() {
        let listStudentView = assembly.makeListStudent(output: self)
        navigationViewController?.pushViewController(listStudentView, animated: true)
    }
}

// MARK: - AdminOutput

extension Coordinator: ListStudentsOutput {

}
