%dw 2.0
output application/java  
var fields = {
  guid: "guid"
}
fun mapFields(input) =
  {
    value: fields[input]
  }
---
if ((sizeOf(payload)) > 0)
  (using (params = payload)
    {
      (guid: fields.guid ++ " = '" ++ params.guid ++ "'") if not params.guid == null and not params.guid == ""
    } pluck $ joinBy " , ")
else
  ""