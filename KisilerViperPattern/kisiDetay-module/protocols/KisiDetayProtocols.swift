//
//  KisiDetayProtocols.swift
//  KisilerViperPattern
//
//  Created by Burak AÇIK on 30.08.2022.
//

import Foundation

protocol ViewToPresenterKisiDetayProtocol {
    var kisiDetayInteractor: PresenterToInteractorKisiDetayProtocol? {get set}
    
    func guncelle(kisiId: String, kisiAd: String, kisiTel: String)
    
}


protocol PresenterToInteractorKisiDetayProtocol {
    func kisiGuncelle(kisiId: String, kisiAd: String, kisiTel: String)
    
}


protocol PresenterToRouterKisiDetayProtocol {
    static func createModule(ref: KisiDetayVC)
    
}
