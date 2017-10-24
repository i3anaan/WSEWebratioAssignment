-- Researcher [ent3]
alter table "public"."researcher"  add column  "reputation"  float8;


-- REL FK: AuthorToPublication [rel2#role3]
alter table "public"."author_publication"   add constraint fk_author_publication_research foreign key ("author_oid") references "public"."researcher" ("oid");


