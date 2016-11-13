-- Create a view for valid contributors
CREATE OR REPLACE VIEW ValidContributor_q4 AS
SELECT owner, extract(year FROM startdate) AS year, avg(rating) AS avgRating
FROM TravelerRating t JOIN Listing l
ON t.listingId = l.listingId
WHERE extract(year FROM startdate) >= 2006 AND extract(year FROM startdate) <= 2016
GROUP BY owner, extract(year FROM startdate);

-- Create a view for contributor did not improve
CREATE OR REPLACE VIEW NonImproveOwner_q4 AS
SELECT distinct v1.owner as owner
FROM ValidContributor_q4 v1 JOIN ValidContributor_q4 v2
ON v1.owner = v2.owner AND v1.year < v2.year
WHERE v1.avgRating > v2.avgRating;

SELECT to_char((count(distinct v.owner) - count(distinct n.owner)) / count(distinct v.owner) * 100, '999.99') || '%' AS percentage
FROM ValidContributor_q4 v FULL JOIN NonImproveOwner_q4 n
ON v.owner = n.owner;

