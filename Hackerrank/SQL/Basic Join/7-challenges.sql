/* Julia asked her students to create some coding challenges. Write a query to print the hacker_id, 
name, and the total number of challenges created by each student. Sort your results by the total 
number of challenges in descending order. If more than one student created the same number of 
challenges, then sort the result by hacker_id. If more than one student created the same number 
of challenges and the count is less than the maximum number of challenges created, then exclude 
those students from the result. */

select h.hacker_id, h.name, count(*) as c_count 
from Hackers h join Challenges c 
on h.hacker_id = c.hacker_id
group by h.hacker_id, h.name
having c_count = (select count(*) as c_count2 from Challenges c2
                  group by c2.hacker_id
                  order by c_count2 desc limit 1)
       or c_count in (select c_compare
                      from (select h2.hacker_id, h2.name, count(*) as c_compare
                            from Hackers h2 join Challenges c3 on h2.hacker_id = c3.hacker_id
                            group by h2.hacker_id, h2.name) as counts
                      group by c_compare
                      having count(c_compare) = 1)         
order by c_count desc, c.hacker_idl;
