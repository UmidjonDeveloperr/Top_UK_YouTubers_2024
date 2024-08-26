
create view view_uk_top_youtubers_2024 as
select CAST(SUBSTRING(NOMBRE, 1, CHARINDEX('@', NOMBRE) - 1) as varchar(100)) as channel_name,
total_subscribers, total_views, total_videos
from [YouTubeDB].[dbo].[youtube_data_from_python];