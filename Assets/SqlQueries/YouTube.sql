/*
# Data Cleaning Steps
1. Remove unnecessary columns by only selecting the ones we need
2. Extract the you tube channel names from the first columns
3. Rename the column names
*/

select NOMBRE, total_subscribers, total_views, total_videos 
from [YouTubeDB].[dbo].[youtube_data_from_python];

--char index
select CHARINDEX('@', NOMBRE) , NOMBRE from [YouTubeDB].[dbo].[youtube_data_from_python];

--substring
create view view_uk_youtubers_2024 as

select CAST(SUBSTRING(NOMBRE, 1, CHARINDEX('@', NOMBRE) - 1) as varchar(100)) as channel_name,
total_subscribers, total_views, total_videos
from [YouTubeDB].[dbo].[youtube_data_from_python];

