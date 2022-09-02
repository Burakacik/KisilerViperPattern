//
//  AnasayfaProtocols.swift
//  KisilerViperPattern
//
//  Created by Burak AÇIK on 30.08.2022.
//

import Foundation

protocol ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol? {get set}
    var anasayfaView: PresenterToViewAnasayfaProtocol? {get set}
    
    func kisileriYukle()
    func ara(aramaKelimesi:String)
    func sil(kisiId:String)
}

protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol? {get set}
    
    func tumKisileriAl()
    func kisiAra(aramaKelimesi:String)
    func kisiSil(kisiId:String)
}

protocol InteractorToPresenterAnasayfaProtocol {
    func presentaraVeriGonder(kisilerListesi:Array<Kisiler>)
    
}

protocol PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(kisilerListesi:Array<Kisiler>)
    
}

protocol PresenterToRouterAnasayfaProtocol {
    static func createModule(ref: AnasayfaVC)
    
}
