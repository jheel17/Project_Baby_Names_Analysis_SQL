
-- paste in psql and run

\copy names FROM 'C:\Users\12063\OneDrive\Desktop\Project_Baby_Names_Analysis_SQL\cvs_file\StateNames.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
