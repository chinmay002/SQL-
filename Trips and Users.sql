#Write a SQL query to find the cancellation rate of requests with unbanned users (both client and driver must not be banned) each day between "2013-10-01" and "2013-10-03".

#The cancellation rate is computed by dividing the number of canceled (by client or driver) requests with unbanned users by the total number of requests with unbanned users on that day
# Write your MySQL query statement below



select Request_at as Day,cast(sum(case when Status != 'completed' then 1 else 0 end)/
                           count(*) as decimal(16,2)) as "Cancellation Rate"
from Trips t join Users us1
               on (us1.Users_Id= t.Client_Id  and us1.Banned='No' )
             join Users us2 
               on (us2.Users_Id= t.Driver_Id  and us2.Banned='No')
where  Request_at between "2013-10-01" and "2013-10-03"             
group by Request_at
