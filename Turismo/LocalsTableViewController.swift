//
//  LocalsTableViewController.swift
//  Turismo
//
//  Created by Flaviano Dias Fontes on 17/01/18.
//  Copyright © 2018 Flaviano Dias Fontes. All rights reserved.
//

import UIKit
import AlamofireImage

class LocalsTableViewController: UITableViewController {
    let reach = Reachability()
    var locals = [TCCLocal]()
    var currentPage: Int = 1
    var selectedLocal: TCCLocal?
    let cellBuffer: CGFloat = 2
    
    override func viewWillAppear(_ animated: Bool) {
        self.currentPage = 1
        self.locals = [TCCLocal]()
        self.getData(self.currentPage)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.navigationItem.title = "Pontos turísticos"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func getData(_ page: Int) {
        self.reach.getLocalsPaginated(page: page) { (success, locals, message) in
            if success{
                if self.currentPage != 1{
                    self.locals.append(contentsOf: locals)
                }
                else{
                    self.locals = locals
                }
                self.tableView.reloadData()
            }
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.locals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        let local = locals[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "localCell", for: indexPath) as? LocalTableViewCell{
            if let name = local.name{
                cell.localNameUILabel.text = name
            }
            if let url = local.site{
                cell.localSiteUILabel.text = url
            }
            if let address = local.address{
                if let street = address.street{
                    cell.localAddressLine1UILabel.text = street
                }
                if let city = address.city{
                    if let state = address.state{
                        cell.localAddressLine2UILabel.text = "\(city) - \(state)"
                    }
                }
            }
            if let rating = local.rating{
                cell.localRatingUILabel.text = "\(rating)"
            }
            if let thumb = local.thumb{
                cell.localThumbUIImageView.af_setImage(withURL: URL(string: thumb)!)
            }
            
            return cell
        }


        return UITableViewCell()
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    //    Função responsável pelo scroll infinito
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let bottom = scrollView.contentSize.height - scrollView.frame.size.height
        let scrollPosition = scrollView.contentOffset.y
        let buffer: CGFloat = self.cellBuffer * 120
        //        checa se é o fim do scroll
        if scrollPosition > bottom - buffer{
            self.currentPage = self.currentPage + 1
            self.getData(self.currentPage)
            
        }
    }

}
