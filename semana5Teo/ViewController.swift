//
//  ViewController.swift
//  semana5Teo
//
//  Created by mbtec22 on 4/8/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    

    @IBOutlet weak var tableView: UITableView!
    var tasks:[Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tasks = createTask()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    @IBAction func newTask(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
    }
    
    func getTasks(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
        }catch{
            print("SOMETHING WENT WRONG")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
//        if segue.identifier == "addSegue" {
//            let nextVC = segue.destination as! AddTaskViewController
//            nextVC.previousVC = self
//        }
        if segue.identifier == "taskSelectedSegue" {
            let nextVC = segue.destination as! TaskCompleteViewController
            nextVC.task = sender as! Task
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "taskSelectedSegue", sender: task)
        
    }
    
//    func createTask() -> [Task]{
//        let task1 = Task()
//         task1.name = "Lavar los platos"
//        task1.importante = true
//
//        let task2 = Task()
//         task2.name = "Limpiar el cuarto"
//        task2.importante = true
//
//        let task3 = Task()
//         task3.name = "Tocar guitarra"
//        task3.importante = false
//
//    return [task1, task2, task3]
//
//    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.importante == true {
            cell.textLabel?.text = "😎 \(task.name!)"
        }else{
            cell.textLabel?.text = task.name!
        }
        return cell
    }
    
    


}

