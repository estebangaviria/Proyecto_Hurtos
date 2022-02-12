
SELECT  H.departamento, 
		municipio, 
		COUNT(*) AS hurtos_municipio, 
		hurtos_departamento, total, 
		100* CAST(COUNT(*) AS float)  / hurtos_departamento AS proporcion_municipio,
		100* CAST(hurtos_departamento AS float) / total AS proporcion_total
FROM hurtos H 
	JOIN
	(SELECT  departamento, COUNT(departamento) AS hurtos_departamento
		FROM hurtos
		GROUP BY departamento
		ORDER BY departamento
	) AS H2 
ON H.departamento = H2.departamento,
	(SELECT  COUNT(*) AS total FROM hurtos) AS tot

GROUP BY municipio, H.departamento, hurtos_departamento, total
ORDER BY departamento ASC, proporcion_total, proporcion_municipio;


