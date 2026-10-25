-- Tabel yang digunakan: products, users, orders, order_items
-- Periksa skema tabel untuk memastikan data kolom
SELECT table_name,
    column_name,
    data_type
FROM bigquery-public-data.thelook_ecommerce.INFORMATION_SCHEMA.COLUMN_FIELD_PATHS;

-- 1. Analisa produk
--    Tampilkan nama produk, kategori, departemen, merek, dan harga retail dari tabel produk
SELECT 
    name,
    category,
    department,
    brand,
    retail_price
FROM bigquery-public-data.thelook_ecommerce.products;


-- 2.Identifiksi produk premium
SELECT 
    name,
    category,
    brand,
    retail_price
FROM bigquery-public-data.thelook_ecommerce.products
WHERE retail_price >100
ORDER BY 4 DESC;

-- 3.Evaluasi kategori produk
SELECT 
category,
COUNT(name) AS total_product
FROM bigquery-public-data.thelook_ecommerce.products
GROUP BY 1
ORDER BY 2 DESC;

-- 4.Mengenal pelanggan dan pemesan
-- mencari pelanggan yang melakukan pesanan
-- gabungkan tabel users & orders.
-- tampilkan ID pesanan, status pesanan, tanggal pesanan dibuat, nama depan & belakang pelanggan
SELECT
    o.order_id AS ID_pesanan,
    o.status AS status_pesanan,
    o.created_at AS tanggal_pesanan_dibuat,
    u.first_name AS nama_depan,
    u.last_name AS nama_belakang
FROM bigquery-public-data.thelook_ecommerce.orders o
  INNER JOIN bigquery-public-data.thelook_ecommerce.users u
  ON o.user_id = u.id;

-- 5. Analisis penjualan per kategori
-- Produk dengan nilai penjualan terbesar
-- gabungkan order_items dan products, lalu hitung total penjualan berdasarkan kategori
-- tampilkan kategori dan total penjualan, kemudian urutkan dari nilai terbesar
-- gunakan order_items.sale_price sebagai nilai transaksi per item
SELECT 
    p.category,
    SUM(oi.sale_price) AS nilai_transaksi_per_item
FROM bigquery-public-data.thelook_ecommerce.products p
  INNER JOIN bigquery-public-data.thelook_ecommerce.order_items oi
  ON oi.product_id = p.id
  GROUP BY 1
  ORDER BY 2 DESC

  
 