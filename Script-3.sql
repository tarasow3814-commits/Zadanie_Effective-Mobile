--Блок 3. Задание 1: Абитуриенты
Есть таблица examination с двумя полями: id (id абитуриента), scores (кол-во набранных баллов дополнительного вступительного испытания от 0 до 100).
Требуется реализовать запрос, который создаёт колонку с позицией абитуриента в общем рейтинге.--

SELECT
    id,
    scores,
    ROW_NUMBER() OVER (ORDER BY scores DESC) AS position
FROM examination

-- 


--Блок 3. Задание 3 --

SELECT DISTINCT a.client_id
FROM account a
JOIN transaction t ON a.id = t.account_id
WHERE t.transaction_date >= CURRENT_DATE - INTERVAL '1 month'
  AND t.type = 'BUY'  -- предполагаем, что покупки обозначаются типом 'BUY'
GROUP BY a.client_id
HAVING SUM(t.amount) < 5000;
