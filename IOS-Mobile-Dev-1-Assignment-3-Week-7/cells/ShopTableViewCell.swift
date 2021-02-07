import UIKit

class ShopTableViewCell: UITableViewCell {
    static let identifider = String(describing: ShopTableViewCell.self)
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
    
    func configure(_ item:Thing){
        addButton.layer.cornerRadius = addButton.frame.size
            .height/4
        self.item = item
        productImageView.image = UIImage(named: item.imageName ?? "eror image name")
        nameLabel.text = item.name
        descriptionLabel.text = item.description
        priceLabel.text = String(item.price ?? 0.0)+"$"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
