//
//  StudentTableViewCell.swift
//  StudyDiaryMVVM
//
//  Created by Артем Орлов on 16.11.2022.
//

import UIKit

private enum Constants {
    static var leftRighSpacing: CGFloat { 16.0 }
    static var topBottomSpacing: CGFloat { 16.0 }

    static var titleFont: UIFont { .boldSystemFont(ofSize: 16)}
    static var subTitleFont: UIFont { .systemFont(ofSize: 14)}
}

// MARK: - StudentTableViewModel

struct StudentTableViewCellModel {
    let title: String
    let subTitle: String
}

// MARK: - StudentTableViewCell

class StudentTableViewCell: UITableViewCell {

    private let stackView = UIStackView()

    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()

    var model: StudentTableViewCellModel?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subTitleLabel)
        addSubview(stackView)

        stackView.axis = .vertical

        titleLabel.font = Constants.titleFont
        subTitleLabel.font = Constants.subTitleFontç
    }

    private func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.leftRighSpacing),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.leftRighSpacing),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.topBottomSpacing),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.topBottomSpacing)
        ])
    }

    func setup(with model: StudentTableViewCellModel) {
        self.model = model

        titleLabel.text = model.title
        subTitleLabel.text = model.subTitle
    }
}
