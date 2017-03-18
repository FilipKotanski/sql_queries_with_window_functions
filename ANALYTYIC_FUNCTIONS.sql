
Table: single_rental

id	rental_date	rental_period	platform	customer_id	movie_id	payment_date	payment_amount
1	2016-04-09	      1      	desktop	       2	      4	         2016-04-16	           6
2	2016-04-05	      1     	mobile         6	      3	         2016-04-11	           8
3	2016-03-25	      1     	tablet	       4	      2	         2016-03-30	           9
4	2016-02-09	      1     	desktop	       5	      1	         2016-02-12	           8
5	2016-03-15	      1     	mobile	       4	      3	         2016-03-22	           6
6	2016-04-11	      1     	tablet	       5	      5	         2016-04-17	           9
7	2016-01-07	      1     	desktop	       5	      5	         2016-01-13	           9
8	2016-04-09	      1     	mobile	       6	      3	         2016-04-16	           6
9	2016-04-27	      1     	tablet	       2	      1	         2016-04-30	           6
10	2016-03-21	      3     	desktop	       5	      4	         2016-03-24	          21
11	2016-02-10	      3     	mobile	       5	      4	         2016-02-15	          15
12	2016-03-20	      3     	tablet	       7	      4	         2016-03-27	          12
13	2016-04-13	      3     	desktop	       2	      1	         2016-04-18	          18
14	2016-03-08	      3     	desktop	       7	      2	         2016-03-14	          24
15	2016-02-20	      7     	mobile	       4	      2	         2016-02-23	          28
16	2016-04-21	      7     	mobile	       1	      5	         2016-04-26	          28
17	2016-03-26	      7     	mobile	       1	      5	         2016-04-01	          49
18	2016-04-10	      7     	tablet	       3	      1	         2016-04-17	          28
19	2016-01-06	      7     	desktop	       1	      5	         2016-01-11	          49
20	2016-01-12	      7     	desktop	       5	      3	         2016-01-16	          21

For each rental date, show the rental_date,
the sum of payment amounts (column name payment_amounts) from single_rentals
on that day, the sum of payment_amounts on the previous day 
and the difference (column name difference)  between these two values

WITH tab AS (
 
 SELECT rental_date,
        SUM(payment_amount) AS payment_amounts
 FROM single_rental
 GROUP BY rental_date)
 
 SELECT rental_date,
        payment_amounts,
        LAG(payment_amounts) OVER(ORDER BY rental_date RANGE CURRENT ROW),
        payment_amounts-LAG(payment_amounts) OVER(ORDER BY rental_date RANGE CURRENT ROW)
        AS difference
 FROM tab;
 
 Table: customer

id	first_name	last_name	join_date	country
1	Eric	     Rivera	    2015-10-24	USA
2	Brandon	     Thomas	    2015-07-05	USA
3	Ryan	     Young	    2015-09-15	USA
4	Janet	     Simmons	2015-08-20	Scotland
5	Jeffrey	     Washington	2015-03-04	Scotland
6	Kathryn	     Reed	    2015-02-15	Australia
7	Catherine	 Coleman	2015-04-05	Australia
 
 For each customer, show the following information:
 first_name, last_name, the sum of payments for all single rentals 
 (column name sum_of_payments) and the sum of payments of the median customer
 in terms of the sum of payments (since there are 7 customers, pick the 4th customer as the median).
 
 WITH table_name AS(
SELECT DISTINCT first_name,
                last_name,
                SUM(payment_amount) AS sum
FROM customer JOIN single_rental ON customer.id=customer_id
GROUP BY first_name,last_name)

SELECT first_name,last_name,sum,
       NTH_VALUE(sum,4) OVER(ORDER BY sum ROWS BETWEEN UNBOUNDED PRECEDING AND     
                             UNBOUNDED FOLLOWING)
FROM table_name;

Table: movie

id	title	              release_year	genre	editor_rating
1	Avatar	                2009	    fantasy	      8
2	Titanic	                1997	    drama	     10
3	Godfather	            1972	    drama	      8
4	Showgirls               1995	    documentary   3
5	Plan 9 From Outer Space	1959	    fantasy	      2

Table: review

id	rating	customer_id	movie_id
1	  7	        2	      1
2	  8	        6	      1
3	 10	        1	      2
4	 10	        2	      2
5	  8	        3	      2
6	  9	        1	      2
7	  9	        3	      3
8	  9	        7	      3
9	  8	        2	      3
10	  6	        5	      3
11	  3	        5	      4
12	  3	        3	      4
13	  5	        6	      4
14	  1	        2	      4
15	  1	        1	      5
16	  1	        3	      5
17	  3	        4	      5
18	  2	        7	      5

For each movie, show the following information:
title, genre, average user rating for that movie and 
its rank in the respective genre based on that average rating.

  WITH table_name AS(
  
  SELECT DISTINCT title,
                  genre,
                  AVG(rating) OVER(PARTITION BY movie_id ) AS avg
  FROM review JOIN movie ON  movie_id=movie.id)
  
  SELECT title,
         genre,
         avg,
         RANK() OVER(PARTITION BY genre ORDER BY avg )
  FROM table_name;
 
 
 
 