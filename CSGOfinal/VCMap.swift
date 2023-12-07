//
//  VCMap.swift
//  CSGOfinal
//
//  Created by Dunk on 2/12/2566 BE.
//

import UIKit
import GRDB

class VCMap: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var mapName:[String]=[]
    var mapDetail:[String]=[]
    var mapIcon:[String]=[]
    var mapImg:[String]=[]
    
    var dbPath:String=""
    var dbResourcePath:String=""
    var config = Configuration()
    var fileManager = FileManager.default
    
    @IBOutlet weak var tableMap: UITableView!
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
                
                let rows = try Row.fetchCursor(db, sql: "SELECT * FROM Map")
                while let row = try rows.next() {
                    mapName.append(row["name"])
                    mapImg.append(row["image"])
                    mapDetail.append(row["detail"])
                    mapIcon.append(row["icon"])
                }
            }
        } catch {
            
            print(error.localizedDescription)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mapName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! TVC2
        
        cell.mapImg.image = UIImage(named: mapIcon[indexPath.row])
        cell.lbMap.text = mapName[indexPath.row]
        // Configure the cell...
        
        return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableMap.rowHeight = 200
        connect2DB()
        readDB()
        tableMap.reloadData()
        print(mapName)
        print(mapIcon)
        tableMap.dataSource = self
        tableMap.delegate = self



        
        
        
        

        // Do any additional setup after loading the view.
    }
    
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let rowData=self.tableMap.indexPathForSelectedRow?.row
        if segue.identifier == "map" {
            let vc = segue.destination as! VCMap2
            vc.mapNames = mapName[rowData!]
            vc.mapImgs = mapImg[rowData!]
            vc.mapIcons = mapIcon[rowData!]
            vc.mapDetails = mapDetail[rowData!]
        }
    }
    

}
