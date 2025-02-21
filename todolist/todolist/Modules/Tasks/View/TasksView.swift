//
//  TasksView.swift
//  todolist
//
//  Created by Rina Mitina on 21.02.2025.
//

import UIKit

protocol DisplaysTasks: UIView {
    var viewDelegate: TasksViewDelegate? { get set }
}

protocol TasksViewDelegate: AnyObject {
    
}

final class TasksView: UIView {
    weak var viewDelegate: TasksViewDelegate?
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Задачи"
        titleLabel.textAlignment = .left
        titleLabel.font = .boldSystemFont(ofSize: 34)
        return titleLabel
    }()
    
    private let searchInput: UISearchBar = {
        let searchInput = UISearchBar()
        searchInput.placeholder = "Search"
        searchInput.layer.cornerRadius = 10
        
        return searchInput
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension TasksView {
    func addSubviews() {
        addSubview(titleLabel)
        addSubview(searchInput)
    }
    
    func addConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        searchInput.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -15),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            searchInput.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            searchInput.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            searchInput.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            searchInput.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
}

extension TasksView: DisplaysTasks {
    
}
