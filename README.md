### ecommerce-FinalProject

### Requirements Gathering:

Data Requirements:
- Customer: name, email
- Staff: name, role
- Product: name, price, stock, quantity
- Purchase: customer, date, total
- PurchaseItem: product, quantity, price

Use Cases:
Customer:
- Use-Case-01: View products
- Use-Case-02: Search for products by price or name
- Use-Case-03: Purchase a product
- Use-Case-04: View history of purchases

Staff:
- Use-Case-05: Add new product
- Use-Case-06: Update stock or price 
- Use-Case-07: View purchases

### ER Diagram:

<img width="519" height="759" alt="image" src="https://github.com/user-attachments/assets/6329db35-7e1b-4f8a-8bfb-d0c38c88e9ea" />

### Schema Design:

Customer (customer_id *PK*, name, email)

Product (product_id *PK*, name, stock_quantity, price)

Purchase (purchase_id *PK*, customer_id *FK*, PurchaseDate, total)

PurchaseItem (purchase_id *PK* *FK*, product_id *FK* *PK*, quantity, PurchasePrice)
