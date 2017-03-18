
id	name	              platform	       type	   average_rating downloads	 income
1	Manage your budget	   iOS	          business	4.6407751550	34989	804397.11
2	Banking App	           iOS	          business	5.3498863368	4970	79470.30
3	CouchSurfing	       iOS	          travel	6.3912259350	20210	646517.90
4	Shopping List	       iOS	          utility	6.0639225361	33594	940296.06
5	Stock 24 News	       Android	      business	5.6434623087	8295	348307.05
6	Perfect Notes	       Android	      utility	9.9605993188	29703	742277.97
7	Amazing filters	       Android	      camera	8.7427015833	4120	197718.80
8	OverseasTrade	       Windows Phone  business	9.5007765361	12502	74886.98
9	Scientific Calculator  Windows Phone  utility	5.7217209288	13015	572529.85
10	Corporate Chat	       Windows Phone  business	6.9995402484	13712	603190.88
11	Click & Travel	       Windows Phone  travel	5.5346579098	26192	602154.08
12	Cheap Apartments	   Windows Phone  travel	5.7184126335	12727	432590.73

Find the application that ranked 3rd in terms of the greatest number of downloads.
Show its name and the number of downloads

WITH ranking AS (
  
  SELECT name,downloads,RANK() OVER(ORDER BY downloads DESC) AS rank  FROM     
  application
  
  )
  
 SELECT name,downloads FROM ranking WHERE rank=3;