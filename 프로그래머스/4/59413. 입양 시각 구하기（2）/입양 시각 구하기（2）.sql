-- 코드를 입력하세요
SELECT
    B.HOUR,
    NVL(A.COUNT, 0) AS COUNT
FROM
(SELECT
    EXTRACT(HOUR FROM CAST(DATETIME AS TIMESTAMP)) AS HOUR,
    COUNT(ANIMAL_ID) AS COUNT
FROM ANIMAL_OUTS
GROUP BY EXTRACT(HOUR FROM CAST(DATETIME AS TIMESTAMP))
ORDER BY HOUR) A,
(SELECT (LEVEL-1) AS HOUR
        FROM DUAL CONNECT BY LEVEL <= 24) B
WHERE B.HOUR = A.HOUR(+)
ORDER BY HOUR;