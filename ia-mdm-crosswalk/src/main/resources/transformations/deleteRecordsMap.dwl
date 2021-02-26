%dw 2.0
output application/java  
---
payload.deletedRecords map ($.id)