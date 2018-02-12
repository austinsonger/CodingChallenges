/* A median is defined as a number separating the higher half of a data set from the lower half. Query 
the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places. */

select if((select mod(count(LAT_N),2) from STATION) = 0,
            (select round(avg(S.LAT_N), 4) median
                from STATION S
                where ((select count(LAT_N) from STATION where LAT_N > S.LAT_N) + 1) =
                      (select count(LAT_N) from STATION where LAT_N < S.LAT_N)
                    or
                      (select count(LAT_N) from STATION where LAT_N > S.LAT_N) =
                      ((select count(LAT_N) from STATION where LAT_N < S.LAT_N) + 1)
             ),
            (select round(S.LAT_N, 4) median
                from STATION S
                where (select count(LAT_N) from STATION where LAT_N > S.LAT_N) = 
                      (select count(LAT_N) from STATION where LAT_N < S.LAT_N)
             ));
