
Table: sales

store_id	day	        revenue	 transactions	customers
1	      2016-08-01	6708.16	    77	          1465
1	      2016-08-02	3556.00	    36	           762
1	      2016-08-03	2806.82	    30	           650
1	      2016-08-04	6604.80	   103	          1032
1	      2016-08-05	6409.46	    66	           859
1	      2016-08-06	6909.54	   123	          1604
1	      2016-08-07	5596.67	    61	           730
1	      2016-08-08	4254.43	    63	          1439
1	      2016-08-09	2872.62	    30	           635
1	      2016-08-10	2715.27	    48	           524
1	      2016-08-11	3475.64	    64	          1416
1	      2016-08-12	4049.45	    47	          1024
1	      2016-08-13	3211.20	    33	           669
1	      2016-08-14	1502.08	    30	           721
2	      2016-08-01	4828.00	    71	          1704
2	      2016-08-02   17056.00    213	          2132
2	      2016-08-03	7209.78	   108	          2475
2	      2016-08-04   12473.08    166	          2162
2	      2016-08-05	8070.00	   147	          1614
2	      2016-08-06	8220.00	   137	          1781

Take the sales between August 1 and August 10, 2016. For each row,
show the store_id, the day, the revenue on that day and quartile number 
(quartile means we divide the rows into four groups) based on the revenue
of the given store in the descending order.

SELECT store_id,
       day,
       revenue,
       NTILE(4) OVER(PARTITION BY store_id ORDER BY revenue DESC) 
FROM sales WHERE day BETWEEN '2016-08-01' AND '2016-08-10';


For each store, show a row with three columns: store_id,
the revenue on the best day in that store in terms of the revenue and the day
when that best revenue was achieved.

WITH ranking AS (
  SELECT store_id,revenue,day,
  RANK() OVER(PARTITION BY store_id ORDER BY revenue DESC) AS rank
  FROM sales
  )

SELECT store_id,revenue,day
FROM ranking WHERE rank=1;

For each row, show the following columns: store_id, day, 
customers and the number of clients in the 5th greatest store 
in terms of the number of customers on that day.

SELECT store_id,
       day,
       customers,
       NTH_VALUE(customers,5) 
       OVER(PARTITION BY day ORDER BY customers DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) 
       FROM sales;
