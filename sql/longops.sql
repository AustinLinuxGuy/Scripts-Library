--------------------------------------------------------------------------------
-- File: longops.sql
-- Author: AustinLinuxGuy
-- Description: List Long Running Operations
--
--------------------------------------------------------------------------------

select username,sid,serial#, opname, target, sofar, totalwork, units,
       time_remaining, elapsed_seconds,
       SQL_HASH_VALUE,to_char(start_time,'dd-mon-rr HH24:MI:SS')
from V$SESSION_LONGOPS
where time_remaining > 0
/

