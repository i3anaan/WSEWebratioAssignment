-- Notification [ent2]
create table "public"."notification" (
   "oid"  int4  not null,
   "shown"  int4,
   "message"  varchar(255),
   "timestamp"  timestamp,
  primary key ("oid")
);


-- Notifications [rel4]
alter table "public"."researcher"  add column  "oid"  int4;
alter table "public"."researcher"   add constraint fk_researcher_notification foreign key ("oid") references "public"."notification" ("oid");


