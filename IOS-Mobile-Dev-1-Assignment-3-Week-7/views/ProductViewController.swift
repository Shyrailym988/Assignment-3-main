import UIKit

class ProductViewController: UIViewController {
    static let identifider = String(describing: ProductViewController.self)
    static let nib = UINib(nibName: identifider, bundle: nil)
    var item = Thing(name: nil, description: nil, price: nil, imageName: nil)
        
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    @IBAction func addToCart(_ sender: Any) {
        CartSingltone.shared.addToCart(item)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButton.layer.cornerRadius = addButton.frame.size
            .height/4
        configure()
    }
    
    func configure() {
        productImageView.image = UIImage(named: self.item.imageName ?? "eror image name")
        nameLabel.text = self.item.name
        descriptionLabel.text = self.item.description
        priceLabel.text = String(self.item.price ?? 0.0)+"$"
    }
}
