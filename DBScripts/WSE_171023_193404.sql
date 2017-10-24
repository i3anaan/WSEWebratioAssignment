-- Comment_Researcher [rel10]
alter table "public"."comment"  add column  "researcher_oid"  int4;
alter table "public"."comment"   add constraint fk_comment_researcher foreign key ("researcher_oid") references "public"."researcher" ("oid");


