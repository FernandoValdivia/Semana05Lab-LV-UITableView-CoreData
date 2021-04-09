//
//  AddTaskViewController.swift
//  semana5Teo
//
//  Created by mbtec22 on 4/8/21.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var inputTask: UITextField!
    @IBOutlet weak var swImportant: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func btnAddTask(_ sender: UIButton) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        task.name = inputTask.text!
        task.importante = swImportant.isOn
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
    

}
