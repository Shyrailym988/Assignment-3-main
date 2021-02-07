import UIKit

class CartViewController: UIViewController {
    static let identifier = String(describing: CartViewController.self)
    static let nib = UINib(nibName: identifier, bundle: nil)
    
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var buyAllButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartTableViewConfigure()
        buyAllButton.layer.cornerRadius = buyAllButton.frame.size.height/4
    }
    @IBAction func buyAll(_ sender: Any) {
        CartSingltone.shared.buyAllFromCart()
        cartTableView.reloadData()
    }
    
    func cartTableViewConfigure() {
        cartTableView.delegate = self
        cartTableView.dataSource = self
        cartTableView.register(CartTableViewCell.nib, forCellReuseIdentifier: CartTableViewCell.identifider)
    }
}


extension CartViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CartSingltone.shared.cartThing.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartTableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifider) as! CartTableViewCell
        cell.configure(CartSingltone.shared.cartThing[indexPath.row])
        return cell
    }
}
