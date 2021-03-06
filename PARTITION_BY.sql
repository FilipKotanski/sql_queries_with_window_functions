
Table: ticket

id	price	class	journey_id
1	200	      2	       24
2	76	      1	       12
3	102	      2	        6
4	126	      2	       11
5	80	      1	       17
6	74	      1	        5
7	200	      2	        5
8	66	      1	       17
9	59	      1	       22
10	134	      2	       11
11	60	      1	        6
12	89	      1	       14
13	71	      1	        3
14	99	      1	        7
15	166	      2	        3
16	154	      2	        6
17	76	      1	       23
18	106	      2	       23
19	97	      1	        7
20	124	      2	       19

For each ticket, show its id, price and the ratio of its price 
to the sum of all tickets purchased on the same journey.

SELECT ticket.id,
       ticket.price,
       CAST(ticket.price AS numeric)/SUM(ticket.price) 
       OVER (PARTITION BY journey_id) AS ratio 
FROM ticket;
