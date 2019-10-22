////
//  Copyright © 2019 Roo Inc. All rights reserved.
//

import KangarooSDK

enum {{ cookiecutter.module_name }}DataItem {
    case item
}

enum {{ cookiecutter.module_name }}DataAction: Equatable {
    case none
}

fileprivate struct {{ cookiecutter.module_name }}Element {
    let item: {{ cookiecutter.module_name }}DataItem
    let action: {{ cookiecutter.module_name }}DataAction
}

protocol {{ cookiecutter.module_name }}DataProviding: {{ cookiecutter.module_name }}DataUpdating {
    var numberOfRows: Int { get }
    func item(at indexPath: IndexPath) -> {{ cookiecutter.module_name }}DataItem
    func action(at indexPath: IndexPath) -> {{ cookiecutter.module_name }}DataAction
}

final class {{ cookiecutter.module_name }}DataSource: {{ cookiecutter.module_name }}DataProviding {
    
    private var elements: [{{ cookiecutter.module_name }}Element] = []

    var numberOfRows: Int {
        return elements.count
    }

    func item(at indexPath: IndexPath) -> {{ cookiecutter.module_name }}DataItem {
        return elements[indexPath.row].item
    }

    func action(at indexPath: IndexPath) -> {{ cookiecutter.module_name }}DataAction {
        return elements[indexPath.row].action
    }
}

extension {{ cookiecutter.module_name }}DataSource {
    func update() {
        
    }
}
