//
//  LocalViewController.swift
//  Turismo
//
//  Created by Flaviano Dias Fontes on 18/01/18.
//  Copyright © 2018 Flaviano Dias Fontes. All rights reserved.
//

import UIKit

class DetailLocalViewController: UIViewController {

    @IBOutlet weak var thumbUIImageView: UIImageView!
    @IBOutlet weak var nameUILabel: UILabel!
    @IBOutlet weak var descriptionTitleUILabel: UILabel!
    @IBOutlet weak var descriptionBodyUILabel: UILabel!
    @IBOutlet weak var phoneTitleUILabel: UILabel!
    @IBOutlet weak var phoneBodyUILabel: UILabel!
    @IBOutlet weak var urlTitleUILabel: UILabel!
    @IBOutlet weak var urlBodyUILabel: UILabel!
    @IBOutlet weak var addressTitleUILabel: UILabel!
    @IBOutlet weak var addressBodyUILabel: UILabel!
    @IBOutlet weak var photosTitleUILabel: UILabel!
    var local: TCCLocal?
    let reach = Reachability()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getData(){
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
