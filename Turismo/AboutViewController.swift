//
//  AboutViewController.swift
//  Turismo
//
//  Created by Flaviano Dias Fontes on 17/01/18.
//  Copyright © 2018 Flaviano Dias Fontes. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    @IBOutlet weak var UFRPEUIImageView: UIImageView!
    @IBOutlet weak var TCCTitleUILabel: UILabel!
    @IBOutlet weak var professorNameUILabel: UILabel!
    @IBOutlet weak var studentNameUILabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Sobre"
        self.TCCTitleUILabel.text = "Análise comparativa no desenvolvimento de aplicações móveis utilizando Swift e React Native"
        self.professorNameUILabel.text = "Orientador: Gilberto Cysneiros"
        self.studentNameUILabel.text = "Autor: Flaviano Dias Fontes"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
