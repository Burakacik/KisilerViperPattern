//
//  KisiDetayInteractor.swift
//  KisilerViperPattern
//
//  Created by Burak AÇIK on 30.08.2022.
//

import Foundation

class KisiDetayInteractor: PresenterToInteractorKisiDetayProtocol {
    
    let db: FMDatabase?
    
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func kisiGuncelle(kisiId: Int, kisiAd: String, kisiTel: String) {
        db?.open()
        do {
            try db!.executeUpdate("UPDATE kisiler SET kisiAd = ?, kisiTel = ? WHERE kisiId = ?", values: [kisiAd, kisiTel, kisiId])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()    }
    
    
}
