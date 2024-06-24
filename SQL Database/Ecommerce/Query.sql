select 
	p.Pname,
	s.SocialName ,
	ps.StorageLocation ,
	ps.quantity 
from productStorage ps
inner join supplier s on ps.idProductSupplier = s.idSupplier
inner join product p on ps.idProdStorage = p.idProduct;

-- The 5 most valuable products in stock.
SELECT
    p.Pname,
    ps.quantity,
    (ps.quantity * ps.price) AS TotalPrice,
    (ps.quantity * ps.price / total.total_price) * 100 AS Percentage
FROM productStorage ps
INNER JOIN product p ON ps.idProdStorage = p.idProduct
CROSS JOIN (
    SELECT SUM(ps.quantity * ps.price) AS total_price
    FROM productStorage ps
) total
order by Percentage desc;


