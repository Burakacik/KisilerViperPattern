//
//  AnasayfaInteractor.swift
//  KisilerViperPattern
//
//  Created by Burak AÇIK on 30.08.2022.
//

import Foundation

class AnasayfaInteractor: PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    let db: FMDatabase?
    
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func tumKisileriAl() {
        var liste = [Kisiler]()
        db?.open()
        do {
            let rs = try db!.executeQuery("SELECT * FROM kisiler", values: nil)
            while rs.next() {
                let kisi = Kisiler(kisiId: Int(rs.string(forColumn: "kisiId"))!,
                                   kisiAd: rs.string(forColumn: "kisiAd")!,
                                   kisiTel: rs.string(forColumn: "kisiTel")!)
                liste.append(kisi)
                anasayfaPresenter?.presentaraVeriGonder(kisilerListesi: liste)
            }
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func kisiAra(aramaKelimesi: String) {
        var liste = [Kisiler]()
        db?.open()
        do {
            let rs = try db!.executeQuery("SELECT * FROM kisiler WHERE kisiAd like '%\(aramaKelimesi)%'", values: nil)
            while rs.next() {
                let kisi = Kisiler(kisiId: Int(rs.string(forColumn: "kisiId"))!,
                                   kisiAd: rs.string(forColumn: "kisiAd")!,
                                   kisiTel: rs.string(forColumn: "kisiTel")!)
                liste.append(kisi)
                anasayfaPresenter?.presentaraVeriGonder(kisilerListesi: liste)
            }
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func kisiSil(kisiId: Int) {
        db?.open()
        do {
            try db!.executeUpdate("DELETE FROM kisiler WHERE kisiId = ?", values: [kisiId])
            tumKisileriAl()
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    
}

