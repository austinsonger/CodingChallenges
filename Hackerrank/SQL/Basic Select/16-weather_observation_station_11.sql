/* Query the list of CITY names from STATION that either do not start with vowels or 
do not end with vowels. Your result cannot contain duplicates. */

select distinct city from station where
substring(city, 1, 1) not in ('a', 'e', 'i', 'o', 'u') or
substring(city, -1, 1) not in ('a', 'e', 'i', 'o', 'u');
