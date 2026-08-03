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
