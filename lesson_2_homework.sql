������� 1: ������� name, class �� ��������, ���������� ����� 1920

select name, ships.class
from ships
join classes
on ships."class" = classes."class" 
where launched > '1920'
--

-- ������� 2: ������� name, class �� ��������, ���������� ����� 1920, �� �� ������� 1942
select name, ships.class
from ships
join classes
on ships."class" = classes."class" 
where launched > '1920'
and launched <= '1942'

-- ������� 3: ����� ���������� �������� � ������ ������. ������� ���������� � class
--
select count(ships), class 
from ships
group by "class" 

-- ������� 4: ��� ������� ��������, ������ ������ ������� �� ����� 16, ������� ����� � ������. (������� classes)
--
select bore, class, country 
from classes c 
where bore >=16

-- ������� 5: ������� �������, ����������� � ��������� � �������� ��������� (������� Outcomes, North Atlantic). �����: ship.
--

select ship
from outcomes o 
where "result"  = 'sunk'
and battle  = 'North Atlantic'


-- ������� 6: ������� �������� (ship) ���������� ������������ �������
--


select ship 
from outcomes
join battles
on outcomes.battle = battles.name 
where result = 'sunk'
and date = (select max(date) from battles
join outcomes
on outcomes.battle = battles.name
where result = 'sunk')

-- ������� 7: ������� �������� ������� (ship) � ����� (class) ���������� ������������ �������
--
select ship, class 
from outcomes
join battles
on outcomes.battle = battles.name
join ships
on outcomes.ship = ships.name
where result = 'sunk'
and date = (select max(date) from battles
join outcomes
on outcomes.battle = battles.name
where result = 'sunk')


on outcomes.ship = ships.name)

-- ������� 8: ������� ��� ����������� �������, � ������� ������ ������ �� ����� 16, � ������� ���������. �����: ship, class

select ship, ships.class
from ships
join outcomes
on ships.name = outcomes.ship
join classes
on ships.class = classes.class
where result = 'sunk'
and bore >= 16



-- ������� 9: ������� ��� ������ ��������, ���������� ��� (������� classes, country = 'USA'). �����: class
--
select class 
from classes
where country = 'USA'

-- ������� 10: ������� ��� �������, ���������� ��� (������� classes & ships, country = 'USA'). �����: name, class

select name, ships.class 
from classes
join ships
on classes.class = ships.class
where country = 'USA'

--������� 20: ������� ������� ������ hd PC ������� �� ��� ��������������, ������� ��������� � ��������. �������: maker, ������� ������ HD.

select maker, avg(hd)
from product
join pc
on product.model = pc.model
where maker in (select maker from product
where type = 'Printer')
group by maker
