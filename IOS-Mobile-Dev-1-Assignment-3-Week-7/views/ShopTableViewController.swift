//
//  ShopTableViewController.swift
//  IOS-Mobile-Dev-1-Assignment-3-Week-7
//
//  Created by ADMIN ODoYal on 04.02.2021.
//

import UIKit

class ShopTableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension ShopTableViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
