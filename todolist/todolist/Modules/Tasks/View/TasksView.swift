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
    
    enum Constant {
        static let ratioOfFooter = 0.236
    }
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
        searchInput.backgroundImage = UIImage()
        let micImage = UIImage(systemName: "microphone.fill")
        searchInput.setImage(micImage, for: .bookmark, state: .normal)
        searchInput.showsBookmarkButton = true
        
        return searchInput
    }()
    
    private let footerView: UIView = {
        let footerView = UIView()
        footerView.backgroundColor = .systemGray6
        return footerView
    }()
    
    private let countTasksLabel: UILabel = {
        let countTasksLabel = UILabel()
        countTasksLabel.text = "кол-во задач"
        countTasksLabel.font = .systemFont(ofSize: 11)
        return countTasksLabel
    }()
    
    private let addButton: UIButton = {
        let addButton = UIButton()
        let image = UIImage(systemName: "square.and.pencil")
        addButton.setImage(image, for: .normal)
        addButton.tintColor = .yellow
        return addButton
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
        addSubview(footerView)
        
        footerView.addSubview(addButton)
        footerView.addSubview(countTasksLabel)
    }
    
    func addConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        searchInput.translatesAutoresizingMaskIntoConstraints = false
        footerView.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints =  false
        countTasksLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 69),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            searchInput.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            searchInput.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            searchInput.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            searchInput.heightAnchor.constraint(equalToConstant: 36),
            
            footerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            footerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            footerView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: Constant.ratioOfFooter),
            
            countTasksLabel.centerXAnchor.constraint(equalTo: footerView.centerXAnchor),
            countTasksLabel.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 20.5),
            countTasksLabel.bottomAnchor.constraint(equalTo: footerView.bottomAnchor, constant: -39.5),
            
            addButton.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -20),
            addButton.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 13),
            addButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -42)
        ])
    }
}

extension TasksView: DisplaysTasks {
    
}
