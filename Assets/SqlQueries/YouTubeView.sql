/*

# Data Quality Tests
1. The data needs to be 100 records of youtube channels(row count)
2. The data needs 4 fields(column count)
3. The channel name column must be string format, and the other columns must be numerical data types(data type check)
4. Each record must be unique in the dataset(duplicate count check)

row count - 100
column count - 4

# Data Types
1.channel_name - varchar
2.total_subscribers - integer
3.total_views - integer
4.total_videos - integer

Duplicate count = 0
*/

--row count test
select COUNT(*) as number_of_rows from view_uk_youtubers_2024;

--column count check
select COUNT(*) as number_of_columns from INFORMATION_SCHEMA.COLUMNS
where table_name = 'view_uk_youtubers_2024';

--data type check
select COLUMN_NAME, DATA_TYPE from INFORMATION_SCHEMA.COLUMNS
where table_name = 'view_uk_youtubers_2024';

--duplicate count check
select channel_name, COUNT(*) as duplicate_count
from view_uk_youtubers_2024 group by channel_name having COUNT(*) > 1
