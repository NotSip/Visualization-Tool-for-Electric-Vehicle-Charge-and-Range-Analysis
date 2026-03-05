CREATE DATABASE IF NOT EXISTS ev_analysis;
USE ev_analysis;
CREATE TABLE IF NOT EXISTS electric_car_data (
    Brand VARCHAR(100),
    Model VARCHAR(100),
    AccelSec FLOAT,
    TopSpeed_KmH INT,
    Range_Km INT,
    Efficiency_WhKm INT,
    FastCharge_KmH VARCHAR(50),
    RapidCharge VARCHAR(10),
    PowerTrain VARCHAR(10),
    PlugType VARCHAR(50),
    BodyStyle VARCHAR(50),
    Segment CHAR(1),
    Seats INT,
    PriceEuro INT
);
CREATE TABLE IF NOT EXISTS ev_india (
    Car VARCHAR(255),
    Style VARCHAR(100),
    Range_Raw VARCHAR(100),
    Transmission VARCHAR(50),
    VehicleType VARCHAR(50),
    Price_Lakhs FLOAT,
    Capacity VARCHAR(50),
    BootSpace VARCHAR(50),
    BaseModel VARCHAR(100),
    TopModel VARCHAR(100)
);
CREATE TABLE IF NOT EXISTS charging_stations (
    Region VARCHAR(100),
    Address TEXT,
    AuxAddress TEXT,
    Latitude DECIMAL(10, 8),
    Longitude DECIMAL(11, 8),
    Type VARCHAR(50),
    Power_Raw VARCHAR(50),
    Service VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS cheapest_evs (
    Name VARCHAR(255),
    Subtitle VARCHAR(255),
    Acceleration VARCHAR(50),
    TopSpeed VARCHAR(50),
    Range_Raw VARCHAR(50),
    Efficiency VARCHAR(50),
    FastChargeSpeed VARCHAR(50),
    Drive VARCHAR(50),
    Seats INT,
    PriceGermany VARCHAR(50),
    PriceUK VARCHAR(50)
);

-- CLEANED INDIAN EV DATA
CREATE OR REPLACE VIEW view_ev_india_clean AS
SELECT 
    TRIM(Car) AS Car,
    Style,
    CASE 
        WHEN Range_Raw = 'na' OR Range_Raw = '' OR Range_Raw IS NULL THEN NULL 
        ELSE CAST(NULLIF(REGEXP_REPLACE(Range_Raw, '[^0-9]', ''), '') AS UNSIGNED) 
    END AS Range_Km,
    Transmission,
    Price_Lakhs,
    CAST(NULLIF(REGEXP_REPLACE(Capacity, '[^0-9]', ''), '') AS UNSIGNED) AS Seats,
    CASE 
        WHEN BootSpace = 'na' OR BootSpace = '' THEN NULL 
        ELSE CAST(NULLIF(REGEXP_REPLACE(BootSpace, '[^0-9]', ''), '') AS UNSIGNED) 
    END AS BootSpace_L
FROM ev_india;

-- CLEANED CHEAPEST EV DATABASE 
CREATE OR REPLACE VIEW view_cheapest_ev_clean AS
SELECT 
    Name,
    
    CAST(NULLIF(REGEXP_REPLACE(Acceleration, '[^0-9.]', ''), '') AS DECIMAL(10,2)) AS Accel_Sec,
    -- TopSpeed: "150 km/h" -> 150
    CAST(NULLIF(REGEXP_REPLACE(TopSpeed, '[^0-9]', ''), '') AS UNSIGNED) AS TopSpeed_KmH,
    
    CASE 
        WHEN Range_Raw IS NULL OR Range_Raw = '' OR Range_Raw = 'N/A' OR Range_Raw = 'na' THEN NULL
        ELSE CAST(NULLIF(REGEXP_REPLACE(Range_Raw, '[^0-9]', ''), '') AS UNSIGNED)
    END AS Range_Km,
    
    CAST(NULLIF(REGEXP_REPLACE(Efficiency, '[^0-9]', ''), '') AS UNSIGNED) AS Efficiency_WhKm,
    
    CAST(NULLIF(REGEXP_REPLACE(PriceGermany, '[^0-9]', ''), '') AS UNSIGNED) AS Price_Germany_Euro
FROM cheapest_evs
WHERE Name IS NOT NULL;

-- CLEANED GLOBAL EV DATA 
CREATE OR REPLACE VIEW view_electric_car_data_clean AS
SELECT 
    TRIM(Brand) AS Brand,
    TRIM(Model) AS Model,
    AccelSec,
    TopSpeed_KmH,
    Range_Km,
    Efficiency_WhKm,
    CAST(NULLIF(REGEXP_REPLACE(FastCharge_KmH, '[^0-9]', ''), '') AS UNSIGNED) AS FastCharge_KmH,
    RapidCharge,
    PowerTrain,
    PlugType,
    BodyStyle,
    Segment,
    Seats,
    PriceEuro
FROM electric_car_data;

-- CLEANED CHARGING STATIONS
CREATE OR REPLACE VIEW view_charging_clean AS
SELECT 
    Region,
    Latitude,
    Longitude,
    Type,
    CAST(NULLIF(REGEXP_REPLACE(Power_Raw, '[^0-9]', ''), '') AS UNSIGNED) AS Power_kW,
    Service
FROM charging_stations;
