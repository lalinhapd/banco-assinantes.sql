SELECT 
    a.nm_assinante AS nome_assinante,
    e.ds_endereco AS endereco,
    e.complemento,
    e.bairro,
    e.cep,
    m.ds_municipio AS municipio,
    t.dd AS ddd,
    t.n_fone AS telefone
FROM 
    Assinante a
INNER JOIN 
    Endereco e ON a.cd_endereco = e.cd_endereco
INNER JOIN 
    Municipio m ON e.cd_municipio = m.cd_municipio
LEFT OUTER JOIN 
    Telefone t ON a.cd_assinante = t.cd_assinante
ORDER BY 
    a.nm_assinante;

SELECT 
    a.nm_assinante AS nome_assinante,
    r.ds_ramo AS ramo
FROM 
    Assinante a
LEFT OUTER JOIN 
    Ramo r ON a.cd_ramo = r.cd_ramo
ORDER BY 
    r.ds_ramo, 
    a.nm_assinante;

SELECT 
    a.nm_assinante AS nome_assinante,
    e.ds_endereco AS endereco,
    e.complemento,
    e.bairro,
    e.cep,
    t.ds_tipo AS tipo_assinante,
    m.ds_municipio AS municipio
FROM 
    Assinante a
INNER JOIN 
    Endereco e ON a.cd_endereco = e.cd_endereco
INNER JOIN 
    Municipio m ON e.cd_municipio = m.cd_municipio
INNER JOIN 
    Tipo_Assinante t ON a.cd_tipo = t.cd_tipo
WHERE 
    m.ds_municipio = 'Pelotas' 
    AND t.ds_tipo = 'residencial';

SELECT 
    a.nm_assinante,
    COUNT(*) AS qtd_telefones
FROM 
    Assinante a
JOIN 
    Telefone t ON a.cd_assinante = t.cd_assinante
GROUP BY 
    a.nm_assinante
HAVING 
    COUNT(*) > 1;

SELECT 
    a.nm_assinante AS nome_assinante,
    '(' || t.dd || ') ' || t.n_fone AS telefone,
    ta.ds_tipo AS tipo_assinante,
    e.ds_endereco AS endereco,
    m.ds_municipio AS municipio
FROM 
    Assinante a
INNER JOIN 
    Telefone t ON a.cd_assinante = t.cd_assinante
INNER JOIN 
    Tipo_Assinante ta ON a.cd_tipo = ta.cd_tipo
INNER JOIN 
    Endereco e ON a.cd_endereco = e.cd_endereco
INNER JOIN 
    Municipio m ON e.cd_municipio = m.cd_municipio
WHERE 
    ta.ds_tipo = 'comercial'
    AND (m.ds_municipio = 'Natal' OR m.ds_municipio = 'João Câmara')
ORDER BY 
    a.nm_assinante;
