//
//  GearController.swift
//  RxSpecial
//
//  Created by Jason Sanchez on 8/15/19.
//  Copyright © 2019 Jason Sanchez. All rights reserved.
//

import UIKit
import Foundation
import RxSwift
import RxCocoa

class GearController: UIViewController {
    
    @IBOutlet weak var gearTableView: UITableView!
    let bag = DisposeBag()
    private var gears = [Gear]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
}

extension GearController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.gears.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "GearCell", for: indexPath) as? GearViewCell else {
            fatalError("GearViewCell is broken...")
        }
        
        cell.nameLabel.text = self.gears[indexPath.row].name
        
        return cell
    }
    
    private func populateGear() {
        URLRequest.load(resource: Gear.all)
            .subscribe(onNext: { [weak self] result in
                
                if let result = result {
                    self?.gears = result.gears
                    
                    DispatchQueue.main.async {
                        self?.gearTableView.reloadData()
                    }
                }
                
            }).disposed(by: bag)
    }
}
