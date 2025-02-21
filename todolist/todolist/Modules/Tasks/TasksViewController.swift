//
//  TasksViewController.swift
//  todolist
//
//  Created by Rina Mitina on 21.02.2025.
//

import UIKit

final class TasksViewController: UIViewController {
    lazy var contentView: DisplaysTasks = TasksView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
        contentView.viewDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension TasksViewController: TasksViewDelegate {
    
}
