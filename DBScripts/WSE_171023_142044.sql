-- Group [Group]
create table "public"."group" (
   "oid"  int4  not null,
   "groupname"  varchar(255),
  primary key ("oid")
);


-- Module [Module]
create table "public"."module" (
   "oid"  int4  not null,
   "moduleid"  varchar(255),
   "modulename"  varchar(255),
  primary key ("oid")
);


-- User [User]
create table "public"."user" (
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
create table "public"."author" (
   "researcher_oid"  int4  not null,
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
alter table "public"."group"  add column  "module_oid"  int4;
alter table "public"."group"   add constraint fk_group_module foreign key ("module_oid") references "public"."module" ("oid");


-- Group_Module [Group2Module_Module2Group]
create table "public"."group_module" (
   "group_oid"  int4 not null,
   "module_oid"  int4 not null,
  primary key ("group_oid", "module_oid")
);
alter table "public"."group_module"   add constraint fk_group_module_group foreign key ("group_oid") references "public"."group" ("oid");
alter table "public"."group_module"   add constraint fk_group_module_module foreign key ("module_oid") references "public"."module" ("oid");


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "public"."user"  add column  "group_oid"  int4;
alter table "public"."user"   add constraint fk_user_group foreign key ("group_oid") references "public"."group" ("oid");


-- User_Group [User2Group_Group2User]
create table "public"."user_group" (
   "user_oid"  int4 not null,
   "group_oid"  int4 not null,
  primary key ("user_oid", "group_oid")
);
alter table "public"."user_group"   add constraint fk_user_group_user foreign key ("user_oid") references "public"."user" ("oid");
alter table "public"."user_group"   add constraint fk_user_group_group foreign key ("group_oid") references "public"."group" ("oid");


-- User_Researcher [rel1]
alter table "public"."researcher"  add column  "user_oid"  int4;
alter table "public"."researcher"   add constraint fk_researcher_user foreign key ("user_oid") references "public"."user" ("oid");


-- Author_Publication [rel2]
create table "public"."publication" (
   "author_oid"  int4 not null,
   "oid"  int4 not null,
  primary key ("author_oid", "oid")
);
alter table "public"."publication"   add constraint fk_publication_author foreign key ("author_oid") references "public"."author" ("researcher_oid");
alter table "public"."publication"   add constraint fk_publication_publication_2 foreign key ("oid") references "public"."publication" ("oid");


-- Keyword_Publication [rel3]
create table "public"."publication" (
   "keyword_oid"  int4 not null,
   "oid"  int4 not null,
  primary key ("keyword_oid", "oid")
);
alter table "public"."publication"   add constraint fk_publication_keyword foreign key ("keyword_oid") references "public"."keyword" ("oid");
alter table "public"."publication"   add constraint fk_publication_publication foreign key ("oid") references "public"."publication" ("oid");


-- Comment_Publication [rel4]
alter table "public"."comment"  add column  "oid"  int4;
alter table "public"."comment"   add constraint fk_comment_publication foreign key ("oid") references "public"."publication" ("oid");


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
alter table "public"."author"   add constraint fk_author_researcher foreign key ("researcher_oid") references "public"."researcher" ("oid");


