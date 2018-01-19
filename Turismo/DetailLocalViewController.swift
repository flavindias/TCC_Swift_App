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
    var local: TCCLocal!
    let reach = Reachability()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.getData()
        self.addressTitleUILabel.text = "Endereço"
        self.descriptionTitleUILabel.text = "Sobre"
        self.phoneTitleUILabel.text = "Telefone(s)"
        self.urlTitleUILabel.text = "Site"
        self.photosTitleUILabel.text = "Fotos"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getData(){
        self.reach.getLocalDetail(local: self.local) { (success, local, message) in
            if success{
                self.local = local
                
                if let name = self.local.name{
                    self.nameUILabel.text = name
                }
                if let thumb = self.local.thumb{
                    self.thumbUIImageView.af_setImage(withURL: URL(string: thumb)!)
                }
                if let description = self.local.description{
                    self.descriptionBodyUILabel.text = description
                }
                var phone = ""
                if let phone1 = self.local.phone_1{
                    phone = phone1
                }
                if let phone2 = self.local.phone_2{
                    self.phoneBodyUILabel.text = "\(phone) \(phone2)"
                }
                if let url = self.local.site{
                    self.urlBodyUILabel.text = url
                }
                
            }
        }
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
