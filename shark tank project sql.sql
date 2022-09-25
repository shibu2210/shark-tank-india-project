select * from project ..data

--Total episodes

select max(epno) from project ..data
select count(distinct epno) from project ..data

--Pitches

select count(distinct brand) from project ..data

--Pitches converted

select cast(sum(a.converted_not_converted) as float) /cast(count(*) as float) from (
select amountinvestedlakhs , case when amountinvestedlakhs>0 then 1 else 0 end as converted_not_converted from project..data) a

--Total male

select sum(male) from project ..data

--Total female

select sum(female) from project ..data

--Gender ratio

select sum(male)/sum(female) from project ..data

--Total amount invested

select sum(amountinvestedlakhs) from project ..data

--Avg equity taken
select avg(a.equitytakenp) from
(select * from project..data where equitytakenp>0) a

--Highest deal taken

select max(amountinvestedlakhs) from project..data 

--Highest equity taken

select max(equitytakenp) from project..data

--Startups having atleast women

select sum(a.female_count) startupsHavingAtleastWomen from (
select female,case when female>0 then 1 else 0 end as female_count from project..data) a

--Pitches converted having atleast one women

select * from project..data

select sum(b.female_count) from(
select case when a.female>0 then 1 else 0 end as female_count ,a.*from (
(select * from project..data where deal!='No Deal')) a)b

--Avg team members

select avg(teammembers) from project ..data

--Amount invested per deal

select avg(a.amountinvestedlakhs) amount_invested_per_deal from
(select * from project..data where deal!='No Deal') a

--Avg age group of contestants

select avgage,count(avgage) cnt from project..data group by avgage order by cnt desc

--location group of contestants

select location,count(location) cnt from project..data group by location order by cnt desc

--Sector group of contestants

select sector,count(sector) cnt from project..data group by sector order by cnt desc

--Partner deals

select partners,count(partners) cnt from project..data  where partners!='-' group by partners order by cnt desc

