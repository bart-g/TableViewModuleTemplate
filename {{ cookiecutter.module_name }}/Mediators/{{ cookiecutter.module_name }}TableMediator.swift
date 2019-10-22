////
//  Copyright © 2019 Roo Inc. All rights reserved.
//

import UIKit

protocol {{ cookiecutter.module_name }}TableActionHandling: AnyObject {
    
}

protocol {{ cookiecutter.module_name }}DataUpdating: AnyObject {
    func update()
}
  
protocol {{ cookiecutter.module_name }}TableMediating: TableViewUsing, {{ cookiecutter.module_name }}DataUpdating {
    func use(_ actionHandler: {{ cookiecutter.module_name }}TableActionHandling)
}

final class {{ cookiecutter.module_name }}TableMediator: NSObject, {{ cookiecutter.module_name }}TableMediating {
    
    private enum Constants {
        static let estimatedRowHeight: CGFloat = 44.0
    }
    
    private weak var tableView: TableViewProtocol!
    private weak var actionHandler: {{ cookiecutter.module_name }}TableActionHandling!
    private let dataSource: {{ cookiecutter.module_name }}DataProviding
    
    init(dataSource: {{ cookiecutter.module_name }}DataProviding) {
        self.dataSource = dataSource
    }
    
    func use(_ tableView: TableViewProtocol) {
        self.tableView = tableView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = Constants.estimatedRowHeight
        tableView.registerCell(UITableViewCell.self)
    }
    
    func use(_ actionHandler: {{ cookiecutter.module_name }}TableActionHandling) {
        self.actionHandler = actionHandler
    }
    
    func update() {
        dataSource.update()
        tableView.reloadData()
    }
}

extension {{ cookiecutter.module_name }}TableMediator: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch dataSource.item(at: indexPath) {
        case .item:
            let cell: UITableViewCell = tableView.dequeueCell(at: indexPath)
            
            return cell
        }
    }
}

extension {{ cookiecutter.module_name }}TableMediator: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch dataSource.action(at: indexPath) {
        case .none:
            ()
        }
    }
}
