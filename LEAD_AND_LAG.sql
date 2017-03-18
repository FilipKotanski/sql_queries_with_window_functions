

Table: statistics

website_id	day	        users	impressions	clicks	revenue
1	        2016-05-01	36169	108507	     237	 66.34
1	        2016-05-02	29580	295800	     793	214.12
1	        2016-05-03	30907	463605	    1545	401.79
1	        2016-05-04	19154	 57462	     160	 38.31
1	        2016-05-05	10897	163455	     343	 99.58
1	        2016-05-06	24602	369030	     804	184.92
1	        2016-05-07	19882	139174	     348	 76.55
1	        2016-05-08	26932	296252	     782	117.25
1	        2016-05-09	39275	117825	     342	 68.30
1	        2016-05-10	28900	317900	    1029	236.62
1	        2016-05-11	23714	142284	     423	 84.69
1	        2016-05-12	19006	171054	     378	101.95
1	        2016-05-13	24791	198328	     526	 89.43
1	        2016-05-14	27617	165702	     407	 85.50
1	        2016-05-15	 8563	 59941	     135	 33.75
1	        2016-05-16	33679	303111	     609	121.73
1	        2016-05-17	25123	175861	     383	 57.47
1	        2016-05-18	32233	225631	     594	118.75
1	        2016-05-19	33504	335040	     857	197.08
1	        2016-05-20	10830	 86640	     229	 52.58

Lets define conversion rate as the number of clicks divided by the number of impressions,
multiplied by 100 to obtain percentages.

For website_id = 1 and dates between May 15 and May 31, show each statistics row:
day, clicks, impressions, conversion rate and the conversion rate on the previous day.
Name the last column as previous_conversion


SELECT day,
       clicks,
       impressions,
       CAST(clicks AS numeric)/impressions*100  ,
       LAG(CAST(clicks AS numeric))OVER(ORDER BY day)/LAG(impressions) OVER(ORDER BY day)*100 AS previous_conversion 
FROM statistics WHERE website_id=1 AND day BETWEEN '2016-05-15' AND '2016-05-31';

For each statistics row of website_id = 3, show the day,
the number of clicks on that day and a ratio expressed as percentage:
the number of clicks on that day to the greatest number of clicks on any day.
Round the percentage to integer values.

SELECT day,
       clicks,
       ROUND(CAST(clicks AS numeric)/FIRST_VALUE(clicks) 
       OVER(ORDER BY clicks DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)*100)
 FROM statistics WHERE website_id=3;

