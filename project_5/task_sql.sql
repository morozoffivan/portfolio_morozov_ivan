--I
--1.Составьте запрос, который выведет имя вида с наименьшим id. Результат будет соответствовать букве «М».
SELECT species_name
FROM species s
WHERE species_id =
(SELECT MIN(species_id) FROM species s2);
--2.Составьте запрос, который выведет имя вида с количеством представителей более 1800. Результат будет соответствовать букве «Б».
SELECT species_name
FROM species s
WHERE species_amount > 1800;
--3.Составьте запрос, который выведет имя вида, начинающегося на «п» и относящегося к типу с type_id = 5. Результат будет соответствовать букве «О».
SELECT species_name
FROM species s
WHERE species_name
LIKE 'п%'
AND type_id = 5;
--4.Составьте запрос, который выведет имя вида, заканчивающегося на «са» или количество представителей которого равно 5. Результат будет соответствовать букве В.
SELECT species_name
FROM species s
WHERE species_name
LIKE '%са'
OR species_amount = 5;
--II
--1.Составьте запрос, который выведет имя вида, появившегося на учете в 2023 году. Результат будет соответствовать букве «Ы».
SELECT species_name
FROM species s
WHERE to_char(date_start,'YYYY') = to_char(date_start,'2023');
--2. Составьте запрос, который выведет названия отсутствующего (status = absent) вида, расположенного вместе с place_id = 3. Результат будет соответствовать букве «С».
SELECT species_name
FROM places p
JOIN species_in_places sip
ON p.place_id = sip.place_id
JOIN species s
ON s.species_id = sip.species_id
WHERE s.species_status = 'absent' AND p.place_id = 3;
--3. Составьте запрос, который выведет название вида, расположенного в доме и появившегося в мае, а также и количество представителей вида. Название вида будет соответствовать букве «П»
SELECT DISTINCT s.species_amount , s.species_name
FROM places p
JOIN species_in_places sip
ON p.place_id = sip.place_id
JOIN species s
ON s.species_id = sip.species_id
WHERE to_char(s.date_start , 'MM') = to_char(s.date_start , '05') AND p.place_name = 'дом'
GROUP BY s.species_amount, s.species_name;
--4. Составьте запрос, который выведет название вида, состоящего из двух слов (содержит пробел).
SELECT species_name
FROM species s
WHERE species_name LIKE '% %';
--III
--1. Составьте запрос, который выведет имя вида, появившегося с малышом в один день. Результат будет соответствовать букве «Ч».
SELECT species_name
FROM species s
WHERE to_char(date_start, 'YYYY.MM.DD') =
(SELECT to_char(date_start, 'YYYY.MM.DD') FROM species s2 WHERE species_name = 'малыш');
--2. Составьте запрос, который выведет название вида, расположенного в здании с наибольшей площадью.
SELECT s.species_name
            FROM species s
            JOIN species_in_places sip ON s.species_id = sip.species_id 
            JOIN places p ON sip.place_id = p.place_id
            WHERE p.place_name in ('сарай', 'дом')
            ORDER BY p.place_size  DESC
            LIMIT 1

--3. Составьте запрос/запросы, которые найдут название вида, относящегося к 5-й по численности группе проживающей дома.
SELECT species_name, s.species_amount
FROM places p
JOIN species_in_places sip
ON p.place_id = sip.place_id
JOIN species s
ON s.species_id = sip.species_id
WHERE p.place_name = 'дом'
GROUP BY 1,2
ORDER BY s.species_amount DESC LIMIT 5;
--4.Составьте запрос, который выведет сказочный вид (статус fairy), не расположенный ни в одном месте
SELECT species_name
FROM species s
WHERE s.species_status = 'fairy'
AND sip.place_id is null;
