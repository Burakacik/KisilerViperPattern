//
//  KisiKayitProtocols.swift
//  KisilerViperPattern
//
//  Created by Burak AÇIK on 30.08.2022.
//

import Foundation

protocol ViewToPresenterKisiKayitProtocol {
    var kisiKayitInteractor: PresenterToInteractorKisiKayitProtocol? {get set}
    
    func ekle(kisiAd: String, kisiTel: String)
    
}


protocol PresenterToInteractorKisiKayitProtocol {
    func kisiEkle(kisiAd: String, kisiTel: String)
    
}


protocol PresenterToRouterKisiKayitProtocol {
    static func createModule(ref: KisiKayitVC)
    
}
