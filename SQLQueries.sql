-- 1. BASIC OVERVIEW (KPIs)
SELECT 
    COUNT(*) as Total_Users,
    AVG(Daily_Usage_Hours) as Avg_Daily_Hours,
    AVG(Sleep_Hours) as Avg_Sleep,
    AVG(Academic_Performance) as Avg_Academic,
    AVG(Anxiety_Level) as Avg_Anxiety,
   AVG(Addiction_Level) AS Avg_Addiction FROM SocialMediaData

-- 2. USAGE BY AGE GROUP
SELECT 
    CASE 
        WHEN Age <= 18 THEN '16-18'
        WHEN Age <= 20 THEN '19-20'
        ELSE '21-22' 
    END as Age_Group,
    AVG(Daily_Usage_Hours) as Avg_Usage
FROM SocialMediaData
GROUP BY CASE 
        WHEN Age <= 18 THEN '16-18'
        WHEN Age <= 20 THEN '19-20'
        ELSE '21-22' 
    END



-- 3. PHONE USAGE PURPOSE
SELECT 
    Phone_Usage_Purpose,
    COUNT(*) as Users_Count
FROM SocialMediaData
GROUP BY Phone_Usage_Purpose;

--4 Acadmic performance vs social media time
SELECT 
    CASE 
        WHEN Time_on_Social_Media < 2 THEN 'Low Social Media'
        WHEN Time_on_Social_Media < 5 THEN 'Medium Social Media'
        ELSE 'High Social Media'
    END as Social_Media_Level,
    AVG(Academic_Performance) as Avg_Academic
FROM SocialMediaData
GROUP BY CASE 
        WHEN Time_on_Social_Media < 2 THEN 'Low Social Media'
        WHEN Time_on_Social_Media < 5 THEN 'Medium Social Media'
        ELSE 'High Social Media'
    END;

--5 Social Media vs Education 
    SELECT 
    Name,
    Time_on_Social_Media,
    Time_on_Education,
    (Time_on_Education * 1.0) / NULLIF((Time_on_Social_Media + Time_on_Education),0) AS Education_Ratio
FROM SocialMediaData;


--Slicer 1
select Age from SocialMediaData
--Slicer 2
select Gender from SocialMediaData
--Slicer 3
select Phone_Usage_Purpose from SocialMediaData
--Slicer 4
select Addiction_Level from SocialMediaData
