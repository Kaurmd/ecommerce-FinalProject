SELECT
    pi.purchase_id,
    (SELECT name FROM Product WHERE product_id = pi.product_id) AS product_name,
    pi.quantity,
    pi.PurchasePrice
FROM PurchaseItem pi
ORDER BY pi.purchase_id, product_name;
