//
//  AdminViewController.swift
//  StudyDiaryMVVM
//
//  Created by Артем Орлов on 15.11.2022.
//

import UIKit

private struct Constants {
    static var stackViewSpacing: CGFloat { 16 }

    static var listButtonTitle: String { "Список студентов" }
    static var evaluationsButtonTitle: String { "Оценки студентов" }
    static var lessonsButtonTitle: String { "Уроки студентов" }

    static var buttonTextColor: UIColor { .black }
    static var backgroundColor: UIColor { .white }
}

// MARK: - AdminViewControllerInterface
protocol AdminViewControllerInterface: AnyObject {
}

// MARK: - AdminViewController
class AdminViewController: UIViewController {

    private let viewModel: AdminViewModelInferface

    private var stackView = UIStackView()

    private let studentListButton = UIButton()
    private let studentEvaluaButton = UIButton()
    private let studentVisitButton = UIButton()

    init(viewModel: AdminViewModelInferface) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupStackView()

        setupButton(studentListButton,
                    title: Constants.listButtonTitle,
                    action: #selector(listButtonTapped))
        setupButton(studentEvaluaButton,
                    title: Constants.evaluationsButtonTitle,
                    action: #selector(evaluationsButtonTapped))
        setupButton(studentVisitButton,
                    title: Constants.lessonsButtonTitle,
                    action: #selector(lessonsButtonTapped))

        setupConstraints()

        setupUI()
    }

    private func setupButton(_ button: UIButton, title: String, action: Selector) {
        view.addSubview(button)
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        button.setTitleColor(Constants.buttonTextColor, for: .normal)

        stackView.addArrangedSubview(button)
    }

    private func setupStackView() {
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = Constants.stackViewSpacing
    }

    private func setupUI() {
        view.backgroundColor = Constants.backgroundColor
    }

    private func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    // MARK: - Actions

    @objc private func listButtonTapped() {
        viewModel.listButtonTapped()
    }

    @objc private func evaluationsButtonTapped() {
        viewModel.evaluationsButtonTapped()
    }

    @objc private func lessonsButtonTapped() {
        viewModel.lessonsButtonTapped()
    }
}

// MARK: - AdminViewControllerInterfaceExtension
extension AdminViewController: AdminViewControllerInterface {
}
