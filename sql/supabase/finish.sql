WITH obj AS (
    SELECT
        nom,
        row_number() OVER () AS rn
    FROM objets
),
     meta AS (
         SELECT count(*) AS cnt FROM obj
     ),
     rand_tx AS (
         SELECT
             t.id,
             random() AS p,
             (floor(random() * meta.cnt)::int + 1) AS rnd_rn
         FROM transactions t
                  CROSS JOIN meta
     ),
     chosen AS (
         SELECT
             r.id,
             CASE
                 WHEN r.p < 0.3 THEN NULL
                 ELSE o.nom
                 END AS random_objet
         FROM rand_tx r
                  JOIN obj o ON o.rn = r.rnd_rn
     )
UPDATE transactions t
SET objet = c.random_objet
    FROM chosen c
WHERE t.id = c.id;
