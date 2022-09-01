//
//  KisiKayitInteractor.swift
//  KisilerViperPattern
//
//  Created by Burak AÇIK on 30.08.2022.
//

import Foundation

class KisiKayitInteractor: PresenterToInteractorKisiKayitProtocol {
    
    let db: FMDatabase?
    
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func kisiEkle(kisiAd: String, kisiTel: String) {
        db?.open()
        do {
            try db!.executeUpdate("INSERT INTO kisiler (kisiAd, kisiTel) VALUES (?, ?)", values: [kisiAd, kisiTel])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    
}
