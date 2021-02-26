%dw 2.0
output application/java  
---
payload map (payload01, indexOfPayload01) -> {
  contactId: payload01.Id,
  guid: payload01."SSB_CRMSYSTEM_CONTACT_ID__c",
  sourceOrgId: p("asu.sf.api.orgId")
}