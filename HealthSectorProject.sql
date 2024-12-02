SELECT * FROM health_facilities_in_nigeria

--Dropping irrelevant data to analysis (Formhubphoto,Survey_id)
ALTER TABLE health_facilities_in_nigeria
DROP COLUMN survey_id,formhub_photo_id


--RENAMING SOME MISTAKES IN NAMES
UPDATE health_facilities_in_nigeria
SET Facility_name=REPLACE(Facility_name,'Hospitsl','Hospital')
WHERE Facility_name LIKE '%Hospitsl%'

UPDATE health_facilities_in_nigeria
SET facility_type_display=REPLACE(facility_type_display,'Primary Health Center','Primary Health Centre (PHC)')
WHERE facility_type_display='Primary Health Center'

UPDATE health_facilities_in_nigeria
SET facility_type_display=REPLACE(facility_type_display,'Basic Health Centre / Primary Health Clinic','Basic Health Centre or Primary Health Clinic')
WHERE facility_type_display='Basic Health Centre / Primary Health Clinic'

UPDATE health_facilities_in_nigeria
SET facility_type_display=REPLACE(facility_type_display,'District Hospital / Comprehensive Health Centre','District Hospital or Comprehensive Health Centre')
WHERE facility_type_display='District Hospital / Comprehensive Health Centre'

UPDATE health_facilities_in_nigeria
SET facility_type_display=REPLACE(facility_type_display,'Teaching / Specialist Hospital','Teaching Hospital')
WHERE facility_type_display='Teaching / Specialist Hospital' AND Facility_name LIKE '%Teaching%'

UPDATE health_facilities_in_nigeria
SET facility_type_display=REPLACE(facility_type_display,'Teaching / Specialist Hospital','Specialist Hospital')
WHERE facility_type_display='Teaching / Specialist Hospital'

UPDATE health_facilities_in_nigeria
SET facility_type_display=REPLACE(facility_type_display,'District / General Hospital','General Hospital')
WHERE facility_type_display='District / General Hospital' AND Facility_name LIKE '%General%'

UPDATE health_facilities_in_nigeria
SET facility_type_display=REPLACE(facility_type_display,'District / General Hospital','District Hospital')
WHERE facility_type_display='District / General Hospital'

--Grouping the Facility types for consistency
SELECT facility_type_display
FROM health_facilities_in_nigeria
GROUP BY facility_type_display

UPDATE health_facilities_in_nigeria
SET facility_type_display=REPLACE(REPLACE(REPLACE(facility_type_display,'none','NA'),'Information not available / Don''t know','NA'),'Other','NA')




--Trimming columns
UPDATE health_facilities_in_nigeria
SET facility_name=TRIM(facility_name)

UPDATE health_facilities_in_nigeria
SET facility_type_display=TRIM(facility_type_display)

UPDATE health_facilities_in_nigeria
SET facility_id=TRIM(facility_id)

UPDATE health_facilities_in_nigeria
SET community=TRIM(community)

UPDATE health_facilities_in_nigeria
SET ward=TRIM(ward)

UPDATE health_facilities_in_nigeria
SET management=TRIM(management)

UPDATE health_facilities_in_nigeria
SET sector=TRIM(sector)

UPDATE health_facilities_in_nigeria
SET sector=UPPER(sector)


--Detecting and Removing duplicates
SELECT facility_name,COUNT(*) FROM health_facilities_in_nigeria
GROUP BY longitude,latitude,facility_name
Having COUNT(*)>1

WITH HealthCTE as (SELECT *, ROW_NUMBER() OVER (PARTITION BY Facility_name   ORDER BY Facility_name) as DupCount 
FROM health_facilities_in_nigeria)
SELECT * FROM HealthCTE
where DupCount>1

WITH HealthCTE as (SELECT *, ROW_NUMBER() OVER (PARTITION BY Facility_name,latitude,longitude ORDER BY Facility_name) as DupCount 
FROM health_facilities_in_nigeria)
DELETE FROM HealthCTE
where DupCount>1


--Unique LGA cleaning
SELECT unique_lga,SUBSTRING(unique_lga,1,CHARINDEX('_',unique_lga)) AS FacilityState
FROM health_facilities_in_nigeria
WHERE 
NOT LIKE 'cross%'
SELECT CHARINDEX('_',unique_lga,) FROM health_facilities_in_nigeria
--
SELECT unique_
lga
FROM health_facilities_in_nigeria
CROSS APPLY string_split(unique_lga,'-')

SELECT * FROM health_facilities_in_nigeria



--Number of each facility type in Nigeria
SELECT facility_type_display, COUNT(facility_type_display) AS Frequency
FROM health_facilities_in_nigeria
GROUP BY facility_type_display
ORDER BY Frequency DESC

--Number of Public and Private#
SELECT management, COUNT(management) as Frequency FROM health_facilities_in_nigeria
GROUP BY management
ORDER BY Frequency DESC

--Hospitals with MOST medical practioners
SELECT Facility_name,facility_id, SUM(num_chews_fulltime+num_doctors_fulltime+num_nursemidwives_fulltime+num_nurses_fulltime) AS FulltimeWorkers
FROM health_facilities_in_nigeria
GROUP BY Facility_name,facility_id
ORDER BY FulltimeWorkers DESC

--Most available facility type
SELECT facility_type_display, COUNT(facility_type_display) AS NumberOfFacilities
FROM health_facilities_in_nigeria
GROUP BY facility_type_display
ORDER BY NumberOfFacilities DESC

--Number of health facilities per region
SELECT unique_lga, COUNT(facility_id) AS NoOfFacilities 
FROM health_facilities_in_nigeria
GROUP BY unique_lga
ORDER BY NoOfFacilities DESC


--Water availability
SELECT COUNT(facility_id) AS NoWithWater
FROM health_facilities_in_nigeria
WHERE improved_water_supply=1


--Sanitation standard
SELECT COUNT(facility_id) AS NoOfFacilities
FROM health_facilities_in_nigeria
WHERE improved_sanitation=1

--emergency service
SELECT COUNT(facility_id) AS NoOfFacilities
FROM health_facilities_in_nigeria
WHERE emergency_transport=1

--AvailabilIty of vaccine freezers
SELECT unique_lga,
COUNT(facility_id) AS NoOfFacilities
FROM health_facilities_in_nigeria
WHERE vaccines_fridge_freezer=1
GROUP BY unique_lga
ORDER BY NoOfFacilities DESC

SELECT COUNT(facility_id) AS NoOfFacilities
FROM health_facilities_in_nigeria
WHERE vaccines_fridge_freezer=1

---Counselling and familuy support
SELECT COUNT(facility_id) AS NoOfFacilities
FROM health_facilities_in_nigeria
WHERE family_planning_yn=1

--C-section
SELECT COUNT(facility_id) AS NoOfFacility FROM health_facilities_in_nigeria
WHERE c_section_yn=1

--maternal health

SELECT COUNT(facility_id) AS NoOfFacility FROM health_facilities_in_nigeria
WHERE maternal_health_delivery_services=1

--Fulltime workers in each hospital
SELECT *,
(skilled_birth_attendant,num_chews_fulltime,num_nurses_fulltime,num_doctors_fulltime,num_nursemidwives_fulltime)
AS StaffCount FROM health_facilities_in_nigeria
GROUP BY *

ALTER TABLE health_facilities_in_nigeria
ADD  Staff_count int

UPDATE health_facilities_in_nigeria
SET Staff_count= skilled_birth_attendant+num_chews_fulltime+num_nurses_fulltime+num_doctors_fulltime+num_nursemidwives_fulltime

SELECT * FROM health_facilities_in_nigeria

CREATE VIEW StaffCount;


SELECT * FROM health_facilities_in_nigeria INTO NewHealthTable