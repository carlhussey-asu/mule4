%dw 2.0
output application/java  
---
sessionVars.inboundPayload map (payload01, indexOfPayload01) -> {
  "contact_id": payload01.contactId,
  guid: payload01.guid,
  "source_org_id": payload01.sourceOrgId
}