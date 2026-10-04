// Week 7 - NoSQL Product Catalog
// MongoDB

use OnlineOrderDB;

// 1. Create Product Catalog
db.Products.insertMany([
    {
        product_id: "P101",
        product_name: "Laptop",
        category: "Electronics",
        price: 55000,
        stock: 25,
        brand: "Dell",
        ratings: 4.5
    },
    {
        product_id: "P102",
        product_name: "Mobile Phone",
        category: "Electronics",
        price: 20000,
        stock: 50,
        brand: "Samsung",
        ratings: 4.2
    },
    {
        product_id: "P103",
        product_name: "Keyboard",
        category: "Accessories",
        price: 1000,
        stock: 100,
        brand: "Logitech",
        ratings: 4.3
    }
]);

// 2. Display All Products
db.Products.find();

// 3. Find a Product
db.Products.find({
    product_id: "P101"
});

// 4. Find Products by Category
db.Products.find({
    category: "Electronics"
});

// 5. Update Product Price
db.Products.updateOne(
    { product_id: "P101" },
    { $set: { price: 52000 } }
);

// 6. Update Stock
db.Products.updateOne(
    { product_id: "P102" },
    { $set: { stock: 45 } }
);

// 7. Display Updated Products
db.Products.find();

// 8. Delete a Product
db.Products.deleteOne({
    product_id: "P103"
});

// 9. Display Final Product Catalog
db.Products.find();
