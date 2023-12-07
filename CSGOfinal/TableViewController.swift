//
//  TableViewController.swift
//  CSGOfinal
//
//  Created by Dunk on 30/11/2566 BE.
//

import UIKit
import GRDB

class TableViewController: UITableViewController,UISearchBarDelegate {
    var gunType:String=""
    
    var dbPath:String=""
    var dbResourcePath:String=""
    var config = Configuration()
    var fileManager = FileManager.default
    
    var gunName:[String]=[]
    var gunCost:[String]=[]
    var gunSpray:[String]=[]
    var gunImg:[String]=[]
    var gunDetail:[String]=[]
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    func connect2DB(){
        config.readonly = true
        do{
            dbPath = try fileManager
                .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("CSGO4.db")
                .path
            if !fileManager.fileExists(atPath: dbPath) {
                dbResourcePath = Bundle.main.path(forResource: "CSGO4", ofType: "db")!
                try fileManager.copyItem(atPath: dbResourcePath, toPath: dbPath)
            }
        }catch{
            print("An error has occured")
        }
    }
    
    func readDB(){
        do {
            
            let dbQueue = try DatabaseQueue(path: dbPath, configuration: config)
            
            try dbQueue.inDatabase { db in
                
                let rows = try Row.fetchCursor(db, sql: "SELECT * FROM Gun where type = '\(gunType)' order by name")
                while let row = try rows.next() {
                    gunName.append(row["name"])
                    gunCost.append(row["cost"])
                    gunSpray.append(row["spray"])
                    gunImg.append(row["image"])
                    gunDetail.append(row["detail"])
                }
            }
        } catch {
            
            print(error.localizedDescription)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight=150
        connect2DB()
        readDB()
        print(gunName)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searching {
            return searchingNames.count
        } else{
            return gunName.count
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        if searching {
            if let index = gunName.firstIndex(of: searchingNames[indexPath.row]) {
                cell.cellImg.image = UIImage(named: gunImg[index])
                cell.lbName.text = searchingNames[indexPath.row]
                cell.lbCost.text = gunCost[index]
            }
        } else {
            cell.cellImg.image = UIImage(named: gunImg[indexPath.row])
            cell.lbName.text = gunName[indexPath.row]
            cell.lbCost.text = gunCost[indexPath.row]
        }
        
        // Configure the cell...
        
        return cell
    }
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }    
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    var searchingNames = [String]()
    var searching = false
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchingNames = gunName.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let selectedRow = indexPath.row
            var gunDataIndex: Int
            
            if searching {
                gunDataIndex = gunName.firstIndex(of: searchingNames[selectedRow]) ?? 0
            } else {
                gunDataIndex = selectedRow
            }
            
            if segue.identifier == "passdetail" {
                let vc = segue.destination as! VC2
                vc.gName = gunName[gunDataIndex]
                vc.gImg = gunImg[gunDataIndex]
                vc.gCost = gunCost[gunDataIndex]
                vc.gSpray = gunSpray[gunDataIndex]
                vc.gDetail = gunDetail[gunDataIndex]
            }
        }
    }
}
