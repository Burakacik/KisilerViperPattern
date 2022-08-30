//
//  KisiKayitVC.swift
//  KisilerViperPattern
//
//  Created by Burak AÇIK on 30.08.2022.
//

import UIKit

class KisiKayitVC: UIViewController {

    @IBOutlet weak var tfKisiAd: UITextField!
    @IBOutlet weak var tfKisiTel: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func buttonKaydet(_ sender: Any) {
        if let ka = tfKisiAd.text, let kt = tfKisiTel.text {
            kayit(kisiAd: ka, kisiTel: kt)
        }
    }
    
    
    func kayit(kisiAd:String, kisiTel:String) {
        print("Kişi adı:\(kisiAd) - Kişi tel:\(kisiTel)")
    }
}
