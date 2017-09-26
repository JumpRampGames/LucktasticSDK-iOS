//
//  TestTableViewController.swift
//  SwiftLucktastic
//
//  Created by Gog Avagyan on 6/23/17.
//  Copyright © 2017 Gog Avagyan. All rights reserved.
//

import UIKit
import LucktasticSDK

class TestTableViewController: UITableViewController {

    private var rowCount = 0
    private var initialized = false
    
    #if LOCAL_STAGING || STAGING
    let APP_ID = "ifc-2017-dc-stg"
    let PLACEMENT_ID = "ifc-stg-placement1"
    #else
    let APP_ID = "ifc-2017-prod"
    let PLACEMENT_ID = "ifc-prod-placement1"
    #endif
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupTableView(){
        self.rowCount = 30
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 2
        self.tableView.dataSource = self
        self.tableView.delegate = self
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func initSDK(email:String){
        
        let options = [
            "first_name"     : "John",
            "last_name"      : "Lucky",
            "email"          : email,
            "address_1"      : "123 Address Dr.",
            "address_2"      : "",
            "city"           : "Newark",
            "state"          : "NJ",
            "zip"            : "07101",
            "contact_number" : "555-123-4567",
            "placements"     : "ifc-prod-placement1"
        ]
        
        print(options);
        
        Lucktastic.initWithAppId(APP_ID, options: options, success: {
            print("ad: init")
            self.initialized = true;
            self.setupTableView()
        }, failure: { (error) in
            print("error: \(error!)")
        });
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowCount
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == rowCount/2 && initialized {
            var cell = tableView.dequeueReusableCell(withIdentifier: AdCellIdentifier) as? AdCell
            if cell == nil{
                cell = Lucktastic.requestAd(withPlacementId: PLACEMENT_ID, success: {
                    print("success")
                }, failure: { (error) in
                    print("error: \(error!)")
                })!
            }
            return cell!
        }
        let cell = UITableViewCell()
        cell.textLabel?.text = "For example"
        return cell
    }
    


}
