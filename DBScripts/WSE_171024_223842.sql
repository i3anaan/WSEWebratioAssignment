-- Notifications [rel4]
alter table "public"."researcher"  add column  "oid"  int4;
alter table "public"."researcher"   add constraint fk_researcher_notification foreign key ("oid") references "public"."notification" ("oid");


