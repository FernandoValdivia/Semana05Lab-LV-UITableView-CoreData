//
//  TaskCompleteViewController.swift
//  semana5Teo
//
//  Created by mbtec22 on 4/8/21.
//

import UIKit

class TaskCompleteViewController: UIViewController {
    @IBOutlet weak var taskLabel: UILabel!
    var task : Task? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        if task!.importante {
            taskLabel.text = "☕ \(String(describing: task!.name))"
        }else{
            taskLabel.text = task!.name
        }
        
    }
    @IBAction func completeTask(_ sender: UIButton) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
    
}
