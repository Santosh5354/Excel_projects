create database olympics;
use olympics;
select * from athlets_events;

--- 1 . List down all the Olympic games held so far.
select distinct games from athlets_events;

--- 2. Show count of unique sports present in Olympics
select distinct sport from athlets_events;

--- 3. Show how many medal counts present for entire data
select count(medal) from athlets_events where medal not like "NA";

-- 4. Show how many different medals won by team united states
select count(medal), medal as medal_type, team from athlets_events where team = "united states" and 
medal not like "NA" group by medal;

-- 5. Show event wise medals won by united states in order of year
select event,medal,team, year from athlets_events where team="united states" and
 medal not like "na" order by year;
 
 --- 6. Show event wise medals won by united states show from highest to lowest medals won in order
 select event,medal,team from athlets_events where team= "united states" and 
 medal not like"na"
 order by medal desc;
 
 --- 7. show country who won maximum medals.
select team,count(medal)as total_medal from athlets_events  where medal not like "na"
group by team
order by total_medal desc limit 1;
 
 -- 8. show top 10 countries who won gold
 select team,count(medal)as total_gold from athlets_events where medal="gold"
 group by team
 order by total_gold desc limit 10;
 
 -- 9. show in which year did United states won most gold medal
 select team,year,count(medal) from athlets_events where team="united states" and medal=
 "gold" group by year;
 
 -- 10. Find top three players who won most medals along with their sports and country
SELECt name,sport,team,COUNT(medal) AS total_medals
FROM athlets_events where medal not like "na"
GROUP BY name,sport,team
ORDER BY total_medals DESC limit 3;

 -- 11. Find player with most gold medals in cycling along with his country
 select name,team,sport,count(medal)from athlets_events where sport="cycling" and  medal="gold"
 group by team,name;
 
 -- 12. Find player with most medals (Gold+Silver+Bronze) in football also show his country.
 select name,sport,team,count(medal) from athlets_events
 where medal not like 'NA' and 
sport = "football"
group by name,team;
