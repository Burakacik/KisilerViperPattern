//
//  KisiDetayInteractor.swift
//  KisilerViperPattern
//
//  Created by Burak AÇIK on 30.08.2022.
//

import Foundation
import Firebase

class KisiDetayInteractor: PresenterToInteractorKisiDetayProtocol {
    
    var refKisiler = Database.database().reference().child("kisiler")
                                                           
    func kisiGuncelle(kisiId: String, kisiAd: String, kisiTel: String) {
        let guncellenenKisi = ["kisiAd":kisiAd,"kisiTel":kisiTel]
        refKisiler.child(kisiId).updateChildValues(guncellenenKisi)
    }
    
    
}
