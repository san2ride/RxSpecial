//
//  GearController.swift
//  RxSpecial
//
//  Created by Jason Sanchez on 8/15/19.
//  Copyright © 2019 Jason Sanchez. All rights reserved.
//

import UIKit

class GearController: UIViewController {
    
    
    @IBOutlet weak var gearTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
}

extension GearController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath) as! GearViewCell
        
        return cell
    }
}
