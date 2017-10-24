-- Notification [ent2]
create table "public"."notification" (
   "oid"  int4  not null,
   "shown"  int4,
   "message"  varchar(255),
  primary key ("oid")
);


-- Notifications [rel4]
alter table "public"."notification"  add column  "researcher_oid"  int4;
alter table "public"."notification"   add constraint fk_notification_researcher foreign key ("researcher_oid") references "public"."researcher" ("oid");


