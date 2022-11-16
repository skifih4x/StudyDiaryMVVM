//
//  ListStudentsViewController.swift
//  StudyDiaryMVVM
//
//  Created by Артем Орлов on 15.11.2022.
//

import UIKit

private enum Constants {
    static var title: String { "Список студентов" }

    static var studentTableViewIdentifier: String { "StudentTableViewCell" }

    static var backgroundColor: UIColor { .white }
}

// MARK: - ListStudentsViewControllerInerface

protocol ListStudentsViewControllerInerface: AnyObject {
}

// MARK: - ListStudentsViewController
class ListStudentsViewController: UIViewController {

    private let viewModel: ListStudentsViewModelInterface

    private let tableView = UITableView()

    init(viewModel: ListStudentsViewModelInterface) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.viewDidLoad()
        setupTable()
        setupConstraints()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = Constants.backgroundColor
        title = Constants.title
    }

    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func setupTable() {
        view.addSubview(tableView)

        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(StudentTableViewCell.self, forCellReuseIdentifier: Constants.studentTableViewIdentifier)
    }
}

// MARK: - ListStdentsViewConttollerInterface

extension ListStudentsViewController: ListStudentsViewControllerInerface {}

// MARK: - UITableDataSource UITableDelegate

extension ListStudentsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.tableData.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.tableData[section].rows.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        viewModel.tableData[section].section
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.studentTableViewIdentifier, for: indexPath)
                as? StudentTableViewCell else { return UITableViewCell() }
        cell.setup(with: viewModel.tableData[indexPath.section].rows[indexPath.row])
        return cell
    }
}
