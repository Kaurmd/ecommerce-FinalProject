import mysql.connector

db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Manjinderkaur20",
    database="ecommerce"
)
import mysql.connector

db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Manjinderkaur20",
    database="ecommerce"
)

cursor = db.cursor()

# Purchases made by customers and their names
def CustomerPurchases():
    print("\n Customers and Purchases")
    query = """
        SELECT
            p.purchase_id,
            p.PurchaseDate,
            p.total,
            c.customer_id,
            c.name AS customer_name
        FROM Purchase p
        LEFT JOIN Customer c
            ON p.customer_id = c.customer_id
        ORDER BY p.purchase_id;
    """
    cursor.execute(query)
    results = cursor.fetchall()
    for row in results:
        print(row)

# Purchased products and their names
def ProductsPurchased():
    print("\n--- Purchased Products and Names---")
    query = """
        SELECT
            pi.purchase_id,
            (SELECT name FROM Product WHERE product_id = pi.product_id) AS product_name,
            pi.quantity,
            pi.PurchasePrice
        FROM PurchaseItem pi
        ORDER BY pi.purchase_id, product_name;
    """
    cursor.execute(query)
    results = cursor.fetchall()
    for row in results:
        print(row)

# Total Earnings
def total():
    print("\n--- Total Earnings ---")
    query = """
        SELECT 
            SUM(total) AS total
        FROM Purchase
        WHERE total > 0;
    """
    cursor.execute(query)
    result = cursor.fetchone()
    print("Total Earnings:", result[0])

def main():
    while True:
        print("   E-Commerce Database Menu")
        print("--------------------------------")
        print("1. View purchases and customer names")
        print("2. View purchased products and names")
        print("3. View total earnings")
        print("4. Exit")

        choice = input("Choose an option: ")

        if choice == "1":
            CustomerPurchases()
        elif choice == "2":
            ProductsPurchased()
        elif choice == "3":
            total()
        elif choice == "4":
            print("Exiting.")
            break
        else:
            print("Invalid.")

main()

cursor = db.cursor()

# Purchases made by customers and their names
def CustomerPurchases():
    print("\n--- Customers and Purchases ---")
    query = """
        SELECT
            p.purchase_id,
            p.PurchaseDate,
            p.total,
            c.customer_id,
            c.name AS customer_name
        FROM Purchase p
        LEFT JOIN Customer c
            ON p.customer_id = c.customer_id
        ORDER BY p.purchase_id;
    """
    cursor.execute(query)
    results = cursor.fetchall()
    for row in results:
        print(row)

# Purchased products and their names
def ProductsPurchased():
    print("\n--- Purchased Products and Names---")
    query = """
        SELECT
            pi.purchase_id,
            (SELECT name FROM Product WHERE product_id = pi.product_id) AS product_name,
            pi.quantity,
            pi.PurchasePrice
        FROM PurchaseItem pi
        ORDER BY pi.purchase_id, product_name;
    """
    cursor.execute(query)
    results = cursor.fetchall()
    for row in results:
        print(row)

# Total Earnings
def total():
    print("\n--- Total Earnings ---")
    query = """
        SELECT 
            SUM(total) AS total
        FROM Purchase
        WHERE total > 0;
    """
    cursor.execute(query)
    result = cursor.fetchone()
    print("Total Earnings:", result[0])

def main():
    while True:
        print("\n==============================")
        print("   E-Commerce Database Menu")
        print("==============================")
        print("1. View purchases and customer names")
        print("2. View purchased products and names")
        print("3. View total earnings")
        print("4. Exit")

        choice = input("Choose an option: ")

        if choice == "1":
            CustomerPurchases()
        elif choice == "2":
            ProductsPurchased()
        elif choice == "3":
            total()
        elif choice == "4":
            print("Exiting.")
            break
        else:
            print("Invalid.")

main()
