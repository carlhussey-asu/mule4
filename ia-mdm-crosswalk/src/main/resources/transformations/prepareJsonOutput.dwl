%dw 2.0
output application/json  
---
payload map (payload01, indexOfPayload01) -> {
  contactId: payload01."contact_id",
  guid: payload01.guid,
  lastModifiedDate: payload01."last_modified_date" as Datetime {unit: "milliseconds"} as String {format: "yyyy-MM-dd HH:mm:ss.SSS"},
  sourceOrgId: payload01."source_org_id"
}