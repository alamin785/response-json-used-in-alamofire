//
//  ViewController.swift
//  fireofire
//
//  Created by alamin on 3/18/19.
//  Copyright © 2019 alamin. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var list:[[String:AnyObject]] = [[String:AnyObject]]()
    
    @IBOutlet weak var tabl: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       response()
        
        
        
    
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fire") as! UITableViewCell
        let item = self.list [indexPath.row]
        cell.textLabel?.text = item["capital"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    
    
    func response() {
        
        AF.request("https://restcountries.eu/rest/v2/all").responseJSON { response in
            switch response.result{
            case.success:
                self.list = response.result.value as! [[String:AnyObject]]
                self.tabl.reloadData()
            case.failure(let error):
                print(error)
                
            }
        }
        
    }
}

