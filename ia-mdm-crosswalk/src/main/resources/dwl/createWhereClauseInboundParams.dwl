%dw 2.0
output application/java
var fields = {
    "guid": "LOWER(guid)",
    "sourceOrgId": "LOWER(source_org_id)"
}
fun mapFields(field) = 
	{ value: fields[field] }
---
if (sizeOf(attributes.queryParams default '') > 0)

(using (params = attributes.queryParams){
    (guid: fields.guid default '' ++ ' = \'' ++ lower(params.guid default '') ++ '\'') if (params.guid != null and params.guid != ''),
    (sourceOrgId: fields.sourceOrgId default '' ++ ' = \'' ++ lower(params.sourceOrgId default '') ++ '\'') if params.sourceOrgId != null and params.sourceOrgId != ''
}
pluck $
joinBy ' AND ')

else ""