create database Project_3;

use Project_3;
SELECT * FROM project_3.billionaires_wealth_analysiss;

#top 5 richest person in world
select personname,finalWorth 
from project_3.billionaires_wealth_analysiss
order by finalworth desc 
limit 5 ; 

# top billionaire person from  each category
SELECT
    category,
    personname,
    SUM(finalworth) OVER (PARTITION BY category ORDER BY finalworth) AS _finalworth
FROM
    project_3.billionaires_wealth_analysiss
ORDER BY
    _finalworth desc,category ASC;
    
    # billionaires who are selfmade 
    select personname,finalworth
    from  project_3.billionaires_wealth_analysiss
    where selfmade = '1';
    
    # youngest billionaire 
    select personname,age,finalworth
    from  project_3.billionaires_wealth_analysiss
    order by age asc
    limit 10;
    
    # person who is CEO of organiation
    select personname,title ,organization
    from  project_3.billionaires_wealth_analysiss
    where title = 'CEO';
    
    # billionaires from United States 
    select personname,finalworth,country
    from project_3.billionaires_wealth_analysiss
    where country = "United States";
    
    #country having highest GDP
    select country, gdp_country, count(distinct gdp_country) as coun   
    from  project_3.billionaires_wealth_analysiss
    group by country ,gdp_country
    order by gdp_country  desc;
    
    
    # Top female billionaires
    select personname,finalworth,gender
    from project_3.billionaires_wealth_analysiss
    where gender ="F"
    order by finalworth desc;
    
#top person from each industries 
select
     personname,
     industries,
     SUM(finalworth) OVER (PARTITION BY industries ORDER BY finalworth) AS _finalworth
FROM
    project_3.billionaires_wealth_analysiss
ORDER BY
    _finalworth desc, industries ASC;

# country having highest population
select country,population_country ,count(distinct country)
from project_3.billionaires_wealth_analysiss
where population_country  is not null
group by country,population_country
order by population_country desc;
