//
//  model.swift
//  ToDoList
//
//  Created by Глеб Клыга on 20.10.23.
//

import Foundation

var ToDoItems: [[String: Any]] {
    set {
        UserDefaults.standard.set(newValue, forKey: "ToDoDataKey")
        UserDefaults.standard.synchronize()
    }
    get {
        if let array = UserDefaults.standard.array(forKey: "ToDoDataKey") as? [[String: Any]] {
            return array
        } else {
            return []
        }
    }
}

func addItem(nameItem: String, isCompleted: Bool = false) {
    ToDoItems.append(["Name": nameItem, "isCompleted": isCompleted])
}

func removeItem(at index: Int) {
    ToDoItems.remove(at: index)
}

func changeState(at item: Int) -> Bool {
    ToDoItems[item]["isCompleted"] = !(ToDoItems[item]["isCompleted"] as! Bool)
    return ToDoItems[item]["isCompleted"] as! Bool
}


