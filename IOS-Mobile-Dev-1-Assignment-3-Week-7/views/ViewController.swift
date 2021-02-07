import UIKit

class ViewController: UIViewController {
    static let identifier = String(describing: ViewController.self)
    static let nib = UINib(nibName: identifier, bundle: nil)
    
    var productArray = [Thing]()
    @IBOutlet weak var shopTableView: UITableView!
    @IBOutlet weak var shopCollectionView: UICollectionView!
    @IBOutlet weak var viewSegmentedController:UISegmentedControl!
    @IBOutlet weak var cartButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productArrayConfigure()
        shopTableConfigure()
        shopCollectionConfigure()
    }
    @IBAction func showCart(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: CartViewController.identifier) as! CartViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func switchView(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex
            {
            case 0:
                hideShopCollectionView()
            case 1:
                hideShopTableView()
            default:
                break
            }
        shopTableView.reloadData()
        shopCollectionView.reloadData()
    }
    
    func shopTableConfigure(){
        shopTableView.backgroundColor = .systemGray6
        shopTableView.delegate = self
        shopTableView.dataSource = self
        shopTableView.register(ShopTableViewCell.nib, forCellReuseIdentifier: ShopTableViewCell.identifider)
    }
    
    func shopCollectionConfigure(){
        shopCollectionView.backgroundColor = .systemGray6
        shopCollectionView.delegate = self
        shopCollectionView.dataSource = self
        shopCollectionView.register(ShopCollectionViewCell.nib, forCellWithReuseIdentifier: ShopCollectionViewCell.identifider)
    }
    
    func hideShopCollectionView() {
        self.shopCollectionView.isHidden = true
        self.shopTableView.isHidden = false
        
    }
    
    func hideShopTableView() {
        self.shopTableView.isHidden = true
        self.shopCollectionView.isHidden = false
    }
    
    func productArrayConfigure() {
        self.productArray.append(Thing(name: "Apple", description: "An apple is a sweet, edible fruit produced by an apple tree.", price: 50.00 , imageName: "apple"))
        self.productArray.append(Thing(name: "Apricot", description: "An apricot is a fruit, or the tree that bears the fruit, of several species in the genus Prunus (stone fruits).", price: 60.00 , imageName: "apricot"))
        self.productArray.append(Thing(name: "Banana", description: "A banana is an edible fruit – botanically a berry – produced by several kinds of large herbaceous flowering plants in the genus Musa.", price: 70.00 , imageName: "banana"))
        self.productArray.append(Thing(name: "Grapes", description: "A grape is a fruit, botanically a berry, of the deciduous woody vines of the flowering plant genus Vitis.", price: 80.00, imageName: "grapes"))
        self.productArray.append(Thing(name: "Orange", description: "The orange is the fruit of the citrus species Citrus × sinensis in the family Rutaceae.", price: 90.00, imageName: "orange"))
        self.productArray.append(Thing(name: "Kiwi", description: "Kiwi fruit, or Chinese gooseberry is the edible berry of several species of woody vines in the genus Actinidia.", price: 100.00, imageName: "kiwi"))
        self.productArray.append(Thing(name: "Peach", description: "A peach is a soft, juicy and fleshy stone fruit produced by a peach tree.", price: 110.00, imageName: "peach"))
        self.productArray.append(Thing(name: "Watermelon", description: "Watermelon is a delicious and refreshing fruit that’s also good for you.", price: 120.00, imageName: "watermelon"))
        self.productArray.append(Thing(name: "Lemon", description: "Lemons are a popular fruit that people use in small quantities to add flavor to food.", price: 130.00, imageName: "lemon"))
        self.productArray.append(Thing(name: "Garnet", description: "The pomegranate is a fruit-bearing deciduous shrub in the family Lythraceae", price: 140.00, imageName: "garnet"))
        }
}

extension ViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = shopTableView.dequeueReusableCell(withIdentifier: ShopTableViewCell.identifider) as! ShopTableViewCell
        cell.configure(self.productArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(identifier: ProductViewController.identifider) as! ProductViewController
        vc.item = self.productArray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.productArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = shopCollectionView.dequeueReusableCell(withReuseIdentifier: ShopCollectionViewCell.identifider, for: indexPath) as! ShopCollectionViewCell
        cell.configure(self.productArray[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(identifier: ProductViewController.identifider) as! ProductViewController
        vc.item = self.productArray[indexPath.item]
        navigationController?.pushViewController(vc, animated: true)
    }
}
