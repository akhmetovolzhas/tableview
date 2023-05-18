//
//  TableViewController.swift
//  tableview1
//
//  Created by 903-21i on 16.05.2023.
//

import UIKit

class TableViewController: UITableViewController {
    
    //var array = ["1", "2", "3"]
    
//    var arrayNames = ["Ted", "Barney", "Lily", "Marshall", "Robin"]
//
//    var arraySurnames = ["Mosby", "Stinson", "Aldrins", "Esriksen", "Scherbatsky"]
//
//    var arrayImages = ["ted", "barney", "lily", "marshall", "robin"]
    
    var arrayPerson = [Person(name: "Ted", surname: "Mosby", imagename: "ted"),
                       Person(name: "Barney", surname: "Stinson", imagename: "barney"),
                       Person(name: "Lily", surname: "Aldrins", imagename: "lily"),
                       Person(name: "Marshall", surname: "Esriksen", imagename: "marshall")]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        return arrayPerson.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell? = nil
        
        if indexPath.row % 2 == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        }

        // Configure the cell...
        
        let label = cell!.viewWithTag(1000) as! UILabel
        label.text = arrayPerson[indexPath.row].name
        
        let labelSurname = cell!.viewWithTag(1001) as! UILabel
        labelSurname.text = arrayPerson[indexPath.row].surname
        
        let imageview = cell!.viewWithTag(1002) as! UIImageView
        
        imageview.image = UIImage(named: arrayPerson[indexPath.row].imagename)

        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let viewcontroller = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
//        viewcontroller.name = arrayPerson[indexPath.row].name
//
//        viewcontroller.surname = arrayPerson[indexPath.row].surname
//        viewcontroller.imagename = arrayPerson[indexPath.row].imagename
        
        viewcontroller.person = arrayPerson[indexPath.row]
        
        navigationController?.show(viewcontroller, sender: self)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
//            arrayNames.remove(at: indexPath.row)
//            arraySurnames.remove(at: indexPath.row)
//            arrayImages.remove(at: indexPath.row)
            arrayPerson.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    
    @IBAction func addContact(_ sender: Any) {
//        arrayNames.append("Olzhas")
//        arraySurnames.append("Akhmetov")
//        arrayImages.append("avatar")
        arrayPerson.append(Person(name: "Olzhas", surname: "Akhmetov", imagename: "avatar"))
        tableView.reloadData()
    }
    
    

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
