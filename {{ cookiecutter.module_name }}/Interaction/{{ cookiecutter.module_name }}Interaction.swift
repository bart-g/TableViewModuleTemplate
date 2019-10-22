//
//  Copyright © {% now 'local', '%Y' %} {{ cookiecutter.company_name }}. All rights reserved.
//

protocol {{ cookiecutter.module_name }}Interacting: {{ cookiecutter.module_name }}TableActionHandling {
    func use(_ renderer: {{ cookiecutter.module_name }}Rendering)
    func use(_ dataUpdater: {{ cookiecutter.module_name }}DataUpdating)
}

final class {{ cookiecutter.module_name }}Interaction: {{ cookiecutter.module_name }}Interacting {
    
    private weak var renderer: {{ cookiecutter.module_name }}Rendering!
    private weak var dataUpdater: {{ cookiecutter.module_name }}DataUpdating!
    private let navigation: {{ cookiecutter.module_name }}Navigating
    
    init(navigation: {{ cookiecutter.module_name }}Navigating) {
       self.navigation = navigation
    }
    
    func use(_ renderer: {{ cookiecutter.module_name }}Rendering) {
        self.renderer = renderer
    }
    
    func use(_ dataUpdater: {{ cookiecutter.module_name }}DataUpdating) {
        self.dataUpdater = dataUpdater
    }
}
