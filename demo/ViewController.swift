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

    private var index = 0
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "demo"
        
        let left = UIBarButtonItem(title: "more", style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem = left
        
        let right = UIBarButtonItem(title: "add", style: .plain, target: nibName, action: nil)
        right.accessibilityLabel = "right_bar_btn"
        right.accessibilityIdentifier = "identifier_01"
        navigationItem.rightBarButtonItem = right
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "string")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        schedule()
    }
    
    // MARK: private
    @objc private func schedule() -> Void {
        index += 1
        if index % 2 == 0 {
            NEVisualStatistics.showMaskView()
        }
        else {
            NEVisualStatistics.hideMaskView()
        }
        
        perform(#selector(schedule), with: nil, afterDelay: 1)
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

