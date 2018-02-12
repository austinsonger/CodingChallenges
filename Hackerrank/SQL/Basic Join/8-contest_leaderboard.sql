/* You did such a great job helping Julia with her last coding contest challenge that she wants you to 
work on this one, too!

The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query 
to print the hacker_id, name, and total score of the hackers ordered by the descending score. If more 
than one hacker achieved the same total score, then sort the result by ascending hacker_id. Exclude all 
hackers with a total score of 0 from your result. */

select h_id, h_name, sum(ch_score) as total_score
from (select h.hacker_id as h_id, h.name as h_name, s.challenge_id as ch_id, max(s.score) as ch_score 
      from Hackers h join Submissions s
      on h.hacker_id = s.hacker_id
      group by h.hacker_id, h.name, s.challenge_id) as max_score
group by h_id, h_name
having total_score > 0
order by total_score desc, h_id;
