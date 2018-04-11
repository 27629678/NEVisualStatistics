//
//  ViewController.swift
//  demo
//
//  Created by hzyuxiaohua on 11/04/2018.
//  Copyright © 2018 hzyuxiaohua. All rights reserved.
//

import UIKit
import NEVisualStatistics

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "demo"
        
        let left = UIBarButtonItem(title: "more", style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem = left
        
        let right = UIBarButtonItem(title: "add", style: .plain, target: nibName, action: nil)
        navigationItem.rightBarButtonItem = right
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "string")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        handle((navigationController?.view)!)
        handle((tabBarController?.view)!)
    }
    
    private func handle(_ view: UIView) -> Void {
        if view.subviews.count == 0 {
            if view.isKind(of: UIControl.self) {
                print("did add mask: \(type(of: view))")
                view.showStatisticsMaskView(false)
            }
            
            return
        }
        
        for subview in view.subviews {
            handle(subview)
        }
        
        if view.isKind(of: UIControl.self) {
            print("did add mask: \(type(of: view))")
            view.showStatisticsMaskView(false)
        }
    }
    
    // MARK: delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "string", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

