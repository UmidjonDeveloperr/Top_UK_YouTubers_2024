/*
1. Define the variables
2. Create a CTE that rounds the average views per video
3. Select the columns that are required for the analysis
4. Filter the results by the YouTube channels with the highest subscriber bases
5. Order by Net Profit
*/

--1
declare @conversationRate float = 0.02;
declare @productCost money = 5.0;
declare @campaignCost money = 50000.0;

--2
with ChannelData as(select channel_name, total_views, total_videos,
ROUND((cast(total_views as float) / total_videos), -4) as rounded_avg_views_per_video
from [YouTubeDB].[dbo].[view_uk_youtubers_2024])

--3
select channel_name, rounded_avg_views_per_video, 
(rounded_avg_views_per_video * @conversationRate) as potential_units_sold_per_video,
(rounded_avg_views_per_video * @conversationRate * @productCost) as potential_revenue_per_video,
(rounded_avg_views_per_video * @conversationRate * @productCost) - @campaignCost as net_profit
from ChannelData 
--4
where channel_name in ('NoCopyrightSounds', 'DanTDM', 'Dan Rhodes')
--5
order by net_profit desc