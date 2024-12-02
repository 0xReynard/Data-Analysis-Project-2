# Data-Analysis-Project-2
This repository contains SQL Server queries and exported Power BI file for my second end to end project. 

# MEDICAL FACILITIES IN NIGERIA
This repository contains the SQL Queries, Power BI file which were results of analysing Nigerian Facilities Dataset which contains information about various Private and Public institutions at various levels of healthcare services (Primary healthcare, Specialized hospitals, Teaching hospitals etc) as a result carried out on various Nigerian medical facilities in 2019.
The queries explored various metrics to determine the standard of these facilities, availability of various staff in the hospital, healthcare services offered by the hospital etc.

# Software Used
-	SQL Server was used to carry out data cleaning and Exploratory Data Analysis (EDA)
-	Power BI was used to carry out the visualization and additional transformation in the data set.

# Data Source
The queries were run on the health_facilities_in_nigeria table. The table contained columns which had information such as:
•	Facility_name: Name of the facility

•	facility_type_display: Type of healthcare service (Clinic, Teaching Hospital, Specialized hospital etc)

•	sector: indicating the sector the facility is under i.e Health

•	management: shows who owns the hospital (public, private etc)

•	emergency_transport: Presence of emergency transport 

•	num_nurses_fulltime: Number of fulltime Nurses

•	num_doctors_fulltime: Number of fulltime Doctors

•	community: Community in which the Hospital is located

•	unique_lga: Local government in which the hospital falls under

•	longitude & latitude: shows precise location of the hospital

•	facility_id: Unique facility id 

•	improved_water_supply: Access to standard water supply

•	improved_sanitation: If the hospital is up to code sanitary-wise

•	vaccines_fridge_freezer: indicates presence/absence of vaccine storage

•	ward: which ward is the hospital located

•	phcn_electricity: indicates of the facility is connected to the national grid

Other columns include: skilled_birth_attendant, num_chews_fulltime,c_section_yn, child_health_measles_immun_calc, num_nursemidwives_fulltime, maternal_health_delivery_services, antenatal_care_yn, family_planning_yn, malaria_treatment_artemisinin.

# KEY METRICS
1.	Top Facility types to determine which level of healthcare service is prominently available in the country
2.	Management of facility distribution which gives a clear picture of who owns and runs medical facilities in Nigeria
3.	Medical facilities per state: To determine the number of medical facilities in each state
4.	Staff per facility: This shows the number of staff in each hospital
5.	Staff per facility type: This shows the number of staff in each type of health care facility
6.	Services offered: This takes a dive into the various services offered by each facility such as emergency support, C-Section operation, Vaccine storage, family planning etc.
   
# CONCLUSION
These queries have been able to provide insights on the state of medical facilities in Nigeria and can be used to determine which areas in the country need additional healthcare facilities and facilities which require an improvement of medical services rendered. This also can be used by medical graduates to determine which states have a shortage of medical staff which can ultimately aid them in a job search.

# FUTURE IMPROVEMENTS
Future surveys can be done thoroughly to gather extra data to add more details about each facility such as patient admission capacity, presence of surgeons, presence of equipment such as MRI Machine, X-ray Machines etc

