-- Total vehicles per state
SELECT 
    state,
    ev + phev + hev + biodiesel + ethanol_e85 + cng + propane + hydrogen + methanol + gasoline + diesel + unknown_fuel AS total_vehicles
FROM vehicle_data
ORDER BY total_vehicles DESC;

-- Market share percentages per state
SELECT
    state,
    ROUND(ev * 100.0 / (ev + phev + hev + biodiesel + ethanol_e85 + cng + propane + hydrogen + methanol + gasoline + diesel + unknown_fuel), 2) AS ev_pct,
    ROUND(phev * 100.0 / (ev + phev + hev + biodiesel + ethanol_e85 + cng + propane + hydrogen + methanol + gasoline + diesel + unknown_fuel), 2) AS phev_pct,
    ROUND(hev * 100.0 / (ev + phev + hev + biodiesel + ethanol_e85 + cng + propane + hydrogen + methanol + gasoline + diesel + unknown_fuel), 2) AS hev_pct,
    ROUND(gasoline * 100.0 / (ev + phev + hev + biodiesel + ethanol_e85 + cng + propane + hydrogen + methanol + gasoline + diesel + unknown_fuel), 2) AS gasoline_pct
FROM vehicle_data
ORDER BY ev_pct DESC;

-- Top 5 states by EV adoption rate
SELECT
    state,
    ev,
    ROUND(ev * 100.0 / (ev + phev + hev + biodiesel + ethanol_e85 + cng + propane + hydrogen + methanol + gasoline + diesel + unknown_fuel), 2) AS ev_pct
FROM vehicle_data
ORDER BY ev_pct DESC
LIMIT 5;

-- California vs other large states
SELECT
    state,
    ev,
    ROUND(ev * 100.0 / (ev + phev + hev + biodiesel + ethanol_e85 + cng + propane + hydrogen + methanol + gasoline + diesel + unknown_fuel), 2) AS ev_pct
FROM vehicle_data
WHERE state IN ('California', 'Texas', 'Florida', 'New York', 'Illinois')
ORDER BY ev_pct DESC;

-- Alternative fuels totals across all states
SELECT
    SUM(biodiesel) AS total_biodiesel,
    SUM(ethanol_e85) AS total_ethanol,
    SUM(cng) AS total_cng,
    SUM(propane) AS total_propane,
    SUM(hydrogen) AS total_hydrogen,
    SUM(methanol) AS total_methanol
FROM vehicle_data;

-- Bottom 5 states by EV adoption rate
SELECT
    state,
    ev,
    ROUND(ev * 100.0 / (ev + phev + hev + biodiesel + ethanol_e85 + cng + propane + hydrogen + methanol + gasoline + diesel + unknown_fuel), 2) AS ev_pct
FROM vehicle_data
ORDER BY ev_pct ASC
LIMIT 5;