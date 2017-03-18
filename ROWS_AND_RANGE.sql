
Table: stock_change

id	product_id	quantity	changed
1	   5	     -90	   2016-09-11
2	   2	     -91	   2016-08-16
3	   5	     -15	   2016-06-08
4	   2	      51	   2016-06-10
5	   1	     -58	   2016-08-09
6	   1	     -84	   2016-09-28
7	   4	      56	   2016-06-09
8	   5	      73	   2016-09-22
9	   1	     -43	   2016-06-07
10	   2	     -79	   2016-07-27
11	   4	      93	   2016-09-22
12	   4	      74	   2016-06-13
13	   2	     -37	   2016-08-02
14	   7	      19	   2016-07-14
15	   7	     -72	   2016-09-13
16	   7	     -13	   2016-08-28
17	   3	      23	   2016-07-24
18	   1	      24	   2016-08-17
19	   3	      77	   2016-08-11
20	   1	      24	   2016-08-28

Pick those stock changes which refer to product_id = 3. 
For each of them, show the id, changed date, quantity,
and the running total, indicating the current stock status. 
Sort the rows by the changed date in the ascending order.

SELECT id,changed,quantity,SUM(quantity) OVER(ORDER BY changed  ROWS UNBOUNDED PRECEDING) 
FROM stock_change WHERE product_id=3;

For each stock_change, show its id, changed date and the number of any stock_changes 
that took place on the same day or any time earlier.

SELECT id,
       changed,
       COUNT(changed) OVER(ORDER BY changed RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
FROM stock_change;



Table: single_order

id	  placed  total_price
1	2016-07-10	3876.76
2	2016-07-10	3949.21
3	2016-07-18	2199.46
4	2016-06-13	2659.63
5	2016-06-13	602.03
6	2016-06-13	3599.83
7	2016-06-29	4402.04
8	2016-08-21	4553.89
9	2016-08-30	3575.55
10	2016-08-01	4973.43
11	2016-08-05	3252.83
12	2016-08-05	3796.42

For each single_order, show its placed date, total_price and the average price
from the current single_order and three previous orders (in terms of the placed date).

SELECT placed,
       total_price,
       AVG(total_price) OVER (ORDER BY placed   ROWS BETWEEN 3 PRECEDING AND CURRENT ROW)
FROM single_order;

Table: revenue

department_id	 year	  amount
1	            2011	65342.87
1	            2012	75701.18
1	            2013	77193.70
1	            2014	48629.92
1	            2015	57473.22
2	            2011	45828.17
2	            2012	39771.22
2	            2013	38502.23
2	            2014	66505.80
2	            2015	62086.19
3	            2011	35549.41
3	            2012	47770.94
3	            2013	42497.93
3	            2014	64161.23
3	            2015	41491.15

For each row sorted by the year, show its department_id, year, amount, 
the average amount from all departments in the given year and the difference between
the amount and the average amount.

SELECT department_id,
       year,
       amount,
       AVG(amount) OVER(ORDER BY year RANGE CURRENT ROW),
       amount-AVG(amount) OVER(ORDER BY year RANGE CURRENT ROW) 
FROM revenue;

