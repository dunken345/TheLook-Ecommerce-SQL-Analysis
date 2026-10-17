-- country mana yang berada di rangking 1 -> china
-- berapa total order country tersebut -> 42494
-- apakah rangking berubah ketika hanya complete order yang dihitung - china jadi 10474
-- status order apa yang paling banyak
-- apa satu hal menarik yang kamu temukan dari data

SELECT u.country,
      COUNT(*) AS total_order
FROM `bigquery-public-data.thelook_ecommerce.users` u
INNER JOIN `bigquery-public-data.thelook_ecommerce.orders` o
      ON u.id = o.user_id
GROUP BY 1 
ORDER BY 2 DESC
LIMIT 1;

-- jawaban no 3
SELECT u.country,
      COUNT(*) AS total_order,
      o.status
FROM `bigquery-public-data.thelook_ecommerce.users` u
INNER JOIN `bigquery-public-data.thelook_ecommerce.orders` o
      ON u.id = o.user_id
WHERE o.status = "Complete"
GROUP BY 1,3
ORDER BY 2 DESC;

-- jawaban no 4
SELECT o. status,
      COUNT(*) AS status_order,
FROM `bigquery-public-data.thelook_ecommerce.orders` o
GROUP BY 1
ORDER BY 2 DESC;

-- jawaban no 5 : analisa kolom & tabel yang di perlukan dalam menjawab pertanyaan