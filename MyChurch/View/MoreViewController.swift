//
//  MoreViewController.swift
//  MyChurch
//
//  Created by 백승화 on 2020/04/22.
//  Copyright © 2020 백승화. All rights reserved.
//

import UIKit

class MoreViewController : UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    var list = [MoreList]()
    let morelist = ["차량운행","선교현황","목장안내","교회위치"]
    
    override func viewDidLoad() {
        searchDevice()
        self.tableview.delegate = self
        self.tableview.dataSource = self
        navigationItem.largeTitleDisplayMode = .automatic
        for i in 0..<morelist.count {
            list.append(MoreList(title: morelist[i]))
        }
    }
    
    func searchDevice() {
        if UIDevice().userInterfaceIdiom == .phone {
          switch UIScreen.main.nativeBounds.height {
            case 1136:
            print("iPhone se")
            navigationController?.navigationBar.prefersLargeTitles = false
            case 1334:
            print("iPhone 6/6S/7/8")
            navigationController?.navigationBar.prefersLargeTitles = false
            case 2208:
            print("iPhone 6+/6S+/7+/8+")
            navigationController?.navigationBar.prefersLargeTitles = false
            case 2436:
            print("iPhone X")
            navigationController?.navigationBar.prefersLargeTitles = true
            case 2688:
            print("iPhone 11pro Max")
            navigationController?.navigationBar.prefersLargeTitles = true
            case 1792:
            print("iPhone 11/Xr")
            navigationController?.navigationBar.prefersLargeTitles = true
            default:
            print("unknown")
          }
        }
    }
}

extension MoreViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = self.list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        
        cell.title.text = row.title
        //cell.icon.image = row.image
        
        return cell
    }
}
