//
//  ViewController.swift
//  KisilerViperPattern
//
//  Created by Burak AÇIK on 30.08.2022.
//

import UIKit

class AnasayfaVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var kisilerTableView: UITableView!
    
    var kisilerListe = [Kisiler]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        
        let k1 = Kisiler(kisiId: 1, kisiAd: "Burak AÇIK", kisiTel: "0 532 488 2405")
        let k2 = Kisiler(kisiId: 2, kisiAd: "Seda AÇIK", kisiTel: "0 536 633 5472")
        kisilerListe.append(k1)
        kisilerListe.append(k2)
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("Anasayfaya dönüldü.")
    }


}


extension AnasayfaVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Arama sonucu: \(searchText)")
    }
}


extension AnasayfaVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kisi = kisilerListe[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "kisilerHucre", for: indexPath) as! TableViewHucre
        hucre.kisiBilgiLabel.text = "\(kisi.kisiAd!) - \(kisi.kisiTel!)"
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kisi = kisilerListe[indexPath.row]
        performSegue(withIdentifier: "toKisiDetayVC", sender: kisi)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toKisiDetayVC" {
            let kisi = sender as? Kisiler
            let gidilecekVC = segue.destination as! KisiDetayVC
            gidilecekVC.kisi = kisi
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let kisi = kisilerListe[indexPath.row]
        let silAction = UIContextualAction(style: .destructive, title: "Sil") {(contextualAction, view, bool) in
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(kisi.kisiAd!) silinsin mi?", preferredStyle: .alert)
            let iptalButton = UIAlertAction(title: "İptal", style: .cancel) {action in
                DispatchQueue.main.async {
                    self.kisilerTableView.reloadRows(at: [indexPath], with: .right)
                    tableView.reloadData()
                }
            }
            let evetButton = UIAlertAction(title: "Evet", style: .destructive) {action in
                print("\(kisi.kisiAd!) silindi.")
            }
            alert.addAction(iptalButton)
            alert.addAction(evetButton)
            self.present(alert, animated: true)
            
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
    
}
