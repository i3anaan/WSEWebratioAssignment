-- Group [Group]
create table "public"."group_2" (
   "oid"  int4  not null,
   "groupname"  varchar(255),
  primary key ("oid")
);


-- Module [Module]
create table "public"."module_2" (
   "oid"  int4  not null,
   "moduleid"  varchar(255),
   "modulename"  varchar(255),
  primary key ("oid")
);


-- User [User]
create table "public"."user_2" (
   "oid"  int4  not null,
   "username"  varchar(255),
   "password"  varchar(255),
   "email"  varchar(255),
  primary key ("oid")
);


-- Publication [ent1]
create table "public"."publication" (
   "oid"  int4  not null,
   "title"  varchar(255),
   "venue"  varchar(255),
   "year"  int4,
   "abstract"  varchar(255),
   "file"  varchar(255),
  primary key ("oid")
);


-- Researcher [ent3]
create table "public"."researcher" (
   "oid"  int4  not null,
   "university"  varchar(255),
   "name"  varchar(255),
  primary key ("oid")
);


-- Author [ent4]
create table "public"."author_2" (
   "researcher_oid"  int4  not null,
   "oid"  int4  not null,
   "reputation"  int4,
  primary key ("researcher_oid")
);


-- Keyword [ent5]
create table "public"."keyword" (
   "oid"  int4  not null,
   "word"  varchar(255),
  primary key ("oid")
);


-- Comment [ent6]
create table "public"."comment" (
   "oid"  int4  not null,
   "timestamp"  timestamp,
   "textualcontent"  varchar(255),
   "title"  varchar(255),
  primary key ("oid")
);


-- Collection [ent7]
create table "public"."collection" (
   "oid"  int4  not null,
   "description"  varchar(255),
   "title"  varchar(255),
  primary key ("oid")
);


-- University [ent8]
create table "public"."university" (
   "oid"  int4  not null,
   "country"  varchar(255),
   "city"  varchar(255),
   "name"  varchar(255),
  primary key ("oid")
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table "public"."group_2"  add column  "module_2_oid"  int4;
alter table "public"."group_2"   add constraint fk_group_2_module_2 foreign key ("module_2_oid") references "public"."module_2" ("oid");


-- Group_Module [Group2Module_Module2Group]
create table "public"."group_module" (
   "group_2_oid"  int4 not null,
   "module_2_oid"  int4 not null,
  primary key ("group_2_oid", "module_2_oid")
);
alter table "public"."group_module"   add constraint fk_group_module_group_2 foreign key ("group_2_oid") references "public"."group_2" ("oid");
alter table "public"."group_module"   add constraint fk_group_module_module_2 foreign key ("module_2_oid") references "public"."module_2" ("oid");


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "public"."user_2"  add column  "group_2_oid"  int4;
alter table "public"."user_2"   add constraint fk_user_2_group_2 foreign key ("group_2_oid") references "public"."group_2" ("oid");


-- User_Group [User2Group_Group2User]
create table "public"."user_group_2" (
   "user_2_oid"  int4 not null,
   "group_2_oid"  int4 not null,
  primary key ("user_2_oid", "group_2_oid")
);
alter table "public"."user_group_2"   add constraint fk_user_group_2_user_2 foreign key ("user_2_oid") references "public"."user_2" ("oid");
alter table "public"."user_group_2"   add constraint fk_user_group_2_group_2 foreign key ("group_2_oid") references "public"."group_2" ("oid");


-- User_Researcher [rel1]
alter table "public"."researcher"  add column  "user_2_oid"  int4;
alter table "public"."researcher"   add constraint fk_researcher_user_2 foreign key ("user_2_oid") references "public"."user_2" ("oid");


-- Author_Publication [rel2]
alter table "public"."publication"  add column  "author_2_oid"  int4;
alter table "public"."publication"   add constraint fk_publication_author_2 foreign key ("author_2_oid") references "public"."author_2" ("researcher_oid");


-- Keyword_Publication [rel3]
alter table "public"."publication"  add column  "keyword_oid"  int4;
alter table "public"."publication"   add constraint fk_publication_keyword foreign key ("keyword_oid") references "public"."keyword" ("oid");


-- Comment_Publication [rel4]
alter table "public"."publication"  add column  "comment_oid"  int4;
alter table "public"."publication"   add constraint fk_publication_comment foreign key ("comment_oid") references "public"."comment" ("oid");


-- Collection_Publication [rel5]
create table "public"."collection_publication" (
   "collection_oid"  int4 not null,
   "publication_oid"  int4 not null,
  primary key ("collection_oid", "publication_oid")
);
alter table "public"."collection_publication"   add constraint fk_collection_publication_coll foreign key ("collection_oid") references "public"."collection" ("oid");
alter table "public"."collection_publication"   add constraint fk_collection_publication_publ foreign key ("publication_oid") references "public"."publication" ("oid");


-- ownedBy [rel6]
alter table "public"."collection"  add column  "researcher_oid"  int4;
alter table "public"."collection"   add constraint fk_collection_researcher foreign key ("researcher_oid") references "public"."researcher" ("oid");


-- Collection_Keyword [rel7]
create table "public"."collection_keyword" (
   "collection_oid"  int4 not null,
   "keyword_oid"  int4 not null,
  primary key ("collection_oid", "keyword_oid")
);
alter table "public"."collection_keyword"   add constraint fk_collection_keyword_collecti foreign key ("collection_oid") references "public"."collection" ("oid");
alter table "public"."collection_keyword"   add constraint fk_collection_keyword_keyword foreign key ("keyword_oid") references "public"."keyword" ("oid");


-- sharedWith [rel8]
create table "public"."sharedwith" (
   "collection_oid"  int4 not null,
   "researcher_oid"  int4 not null,
  primary key ("collection_oid", "researcher_oid")
);
alter table "public"."sharedwith"   add constraint fk_sharedwith_collection foreign key ("collection_oid") references "public"."collection" ("oid");
alter table "public"."sharedwith"   add constraint fk_sharedwith_researcher foreign key ("researcher_oid") references "public"."researcher" ("oid");


-- Researcher_University [rel9]
create table "public"."researcher_university" (
   "researcher_oid"  int4 not null,
   "university_oid"  int4 not null,
  primary key ("researcher_oid", "university_oid")
);
alter table "public"."researcher_university"   add constraint fk_researcher_university_resea foreign key ("researcher_oid") references "public"."researcher" ("oid");
alter table "public"."researcher_university"   add constraint fk_researcher_university_unive foreign key ("university_oid") references "public"."university" ("oid");


-- GEN FK: Author --> Researcher
alter table "public"."author_2"   add constraint fk_author_2_researcher foreign key ("researcher_oid") references "public"."researcher" ("oid");


