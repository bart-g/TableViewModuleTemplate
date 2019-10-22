//
//  Copyright © {% now 'local', '%Y' %} {{ cookiecutter.company_name }}. All rights reserved.
//

import UIKit

struct {{ cookiecutter.module_name }}Renderable {}

protocol {{ cookiecutter.module_name }}Rendering: AnyObject {
    func render(_ {{ cookiecutter.module_name[0]|lower + cookiecutter.module_name[1:] }}Renderable: {{ cookiecutter.module_name }}Renderable)
}

final class {{ cookiecutter.module_name }}ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let interaction: {{ cookiecutter.module_name }}Interacting
    private let tableMediator: {{ cookiecutter.module_name }}TableMediating
    
    init(interaction: {{ cookiecutter.module_name }}Interacting, tableMediator: {{ cookiecutter.module_name }}TableMediating) {
        self.interaction = interaction
        self.tableMediator = tableMediator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableMediator.use(tableView)
        tableMediator.use(interaction)
        interaction.use(tableMediator)
        interaction.use(self)
    }
}

extension {{ cookiecutter.module_name }}ViewController: {{ cookiecutter.module_name }}Rendering {
    func render(_ {{ cookiecutter.module_name[0]|lower + cookiecutter.module_name[1:] }}Renderable: {{ cookiecutter.module_name }}Renderable) {
        
    }
}

