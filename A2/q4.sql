-- Create a view for valid contributors
CREATE OR REPLACE VIEW ValidContributor_q4 AS
SELECT listingId, extract(year FROM startdate) AS year, avg(rating) AS avgRating
FROM TravelerRating
WHERE extract(year FROM startdate) >= 2006 AND extract(year FROM startdate) <= 2016
GROUP BY listingId, extract(year FROM startdate);

-- Create a view for contributor did not improve
CREATE OR REPLACE VIEW NonImproveOwner_q4 AS
SELECT distinct v1.listingId as listingId
FROM ValidContributor_q4 v1 JOIN ValidContributor_q4 v2
ON v1.listingId = v2.listingId AND v1.year < v2.year
WHERE v1.avgRating > v2.avgRating;

SELECT to_char((count(distinct v.listingId) - count(distinct n.listingId)) / count(distinct v.listingId) * 100, '999D99S') || '%' AS percentage
FROM ValidContributor_q4 v, NonImproveOwner_q4 n;
