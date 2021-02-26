%dw 2.0
output application/java  
var fields = {
  guid: "LOWER(guid)",
  sourceOrgId: "LOWER(source_org_id)"
}
fun mapFields(input) =
  {
    value: fields[input]
  }
---
if ((sizeOf(sessionVars.inboundQueryParams)) > 0)
  (using (params = sessionVars.inboundQueryParams)
    {
      (guid: fields.guid ++ " = '" ++ lower(params.guid) ++ "'") if not params.guid == null and not params.guid == "",
      (sourceOrgId: fields.sourceOrgId ++ " = '" ++ lower(params.sourceOrgId) ++ "'") if not params.sourceOrgId == null and not params.sourceOrgId == ""
    } pluck $ joinBy " AND ")
else
  ""