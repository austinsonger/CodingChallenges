/* Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath 
its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation. */

set @d = 0, @p = 0, @s = 0, @a = 0;

select min(doctor), min(professor), min(singer), min(actor) from
   (select case when occupation = 'Doctor' then (@d := @d + 1)
                when occupation = 'Professor' then (@p := @p + 1)
                when occupation = 'Singer' then (@s := @s + 1)
                when occupation = 'Actor' then (@a := @a + 1) 
           end as rownumber,
           case when occupation = 'Doctor' then name end as doctor,
           case when occupation = 'Professor' then name end as professor,
           case when occupation = 'Singer' then name end as singer,
           case when occupation = 'Actor' then name end as actor
    from occupations order by name) as temp
 group by rownumber;
