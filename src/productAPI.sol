// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.7;

contract productAPI {
    struct Product{
        uint256 id;
        string name;
        uint256 price;
        uint256 quantity;
    }

    mapping(uint256 => Product) public products;
    Product[] public productArray;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(owner == msg.sender, "Only Owner can do this action");
        _;
    }

    address owner;

    // create the product
    function createProduct(uint256 _id, string memory _name, uint256 _price, uint256 _quantity) public onlyOwner {
        Product memory product = Product(_id, _name, _price, _quantity);
        products[_id] = product;
        productArray.push(Product(_id, _name, _price, _quantity));
    }

    // get the product with ID
    function getProduct(uint256 _id) public view returns(string memory, uint256, uint256){
        Product memory product = products[_id];
        return (product.name, product.price, product.quantity);
    }

    // get all product
    function getAllProducts() public view returns(Product[] memory){
        return productArray;
    }

    // update the product with ID
    function updateProduct(uint256 _id, string memory _name, uint256 _price, uint256 _quantity) public onlyOwner{
        require(products[_id].id != 0, "Product not listed yet");
        deleteProduct(_id);
        products[_id] = Product(_id, _name, _price, _quantity);
        productArray.push(Product(_id, _name, _price, _quantity));
    }

    // delete the product with ID
    function deleteProduct(uint256 _id) public onlyOwner {
        require(products[_id].id != 0, "Product not listed yet");
        uint256 lastIndex = productArray.length -1;
        for(uint i = 0; i < lastIndex; i++){
            if(productArray[i].id == _id){
                // swap the product with last product & pop it
                productArray[i] = productArray[lastIndex];
                productArray.pop();
                break;
            }
        } 
    }

}
