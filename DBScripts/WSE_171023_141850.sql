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
   "email"  varchar(255),
   "password"  varchar(255),
   "username"  varchar(255),
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
   "name"  varchar(255),
   "university"  varchar(255),
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
   "title"  varchar(255),
   "textualcontent"  varchar(255),
   "timestamp"  timestamp,
  primary key ("oid")
);


-- Collection [ent7]
create table "public"."collection" (
   "oid"  int4  not null,
   "title"  varchar(255),
   "description"  varchar(255),
  primary key ("oid")
);


-- University [ent8]
create table "public"."university" (
   "oid"  int4  not null,
   "name"  varchar(255),
   "city"  varchar(255),
   "country"  varchar(255),
  primary key ("oid")
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table "public"."group"  add column  "module_oid"  int4;
alter table "public"."group"   add constraint fk_group_module foreign key ("module_oid") references "public"."module" ("oid");
create index "idx_group_module" on "public"."group"("module_oid");


-- Group_Module [Group2Module_Module2Group]
create table "public"."group_module" (
   "group_oid"  int4 not null,
   "module_oid"  int4 not null,
  primary key ("group_oid", "module_oid")
);
alter table "public"."group_module"   add constraint fk_group_module_group foreign key ("group_oid") references "public"."group" ("oid");
alter table "public"."group_module"   add constraint fk_group_module_module foreign key ("module_oid") references "public"."module" ("oid");
create index "idx_group_module_group" on "public"."group_module"("group_oid");
create index "idx_group_module_module" on "public"."group_module"("module_oid");


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "public"."user"  add column  "group_oid"  int4;
alter table "public"."user"   add constraint fk_user_group foreign key ("group_oid") references "public"."group" ("oid");
create index "idx_user_group" on "public"."user"("group_oid");


-- User_Group [User2Group_Group2User]
create table "public"."user_group" (
   "user_oid"  int4 not null,
   "group_oid"  int4 not null,
  primary key ("user_oid", "group_oid")
);
alter table "public"."user_group"   add constraint fk_user_group_user foreign key ("user_oid") references "public"."user" ("oid");
alter table "public"."user_group"   add constraint fk_user_group_group foreign key ("group_oid") references "public"."group" ("oid");
create index "idx_user_group_user" on "public"."user_group"("user_oid");
create index "idx_user_group_group" on "public"."user_group"("group_oid");


-- User_Researcher [rel1]
alter table "public"."researcher"  add column  "user_oid"  int4;
alter table "public"."researcher"   add constraint fk_researcher_user foreign key ("user_oid") references "public"."user" ("oid");
create index "idx_researcher_user" on "public"."researcher"("user_oid");


-- Author_Publication [rel2]
create table "public"."publication" (
   "author_oid"  int4 not null,
   "oid"  int4 not null,
  primary key ("author_oid", "oid")
);
alter table "public"."publication"   add constraint fk_publication_author foreign key ("author_oid") references "public"."author" ("researcher_oid");
alter table "public"."publication"   add constraint fk_publication_publication foreign key ("oid") references "public"."publication" ("oid");
create index "idx_publication_author" on "public"."publication"("author_oid");
create index "idx_publication_publication" on "public"."publication"("oid");


-- Keyword_Publication [rel3]
create table "public"."publication" (
   "keyword_oid"  int4 not null,
   "oid"  int4 not null,
  primary key ("keyword_oid", "oid")
);
alter table "public"."publication"   add constraint fk_publication_keyword foreign key ("keyword_oid") references "public"."keyword" ("oid");
alter table "public"."publication"   add constraint fk_publication_publication_2 foreign key ("oid") references "public"."publication" ("oid");
create index "idx_publication_keyword" on "public"."publication"("keyword_oid");
create index "idx_publication_publication_2" on "public"."publication"("oid");


-- Comment_Publication [rel4]
alter table "public"."comment"  add column  "oid"  int4;
alter table "public"."comment"   add constraint fk_comment_publication foreign key ("oid") references "public"."publication" ("oid");
create index "idx_comment_publication" on "public"."comment"("oid");


-- Collection_Publication [rel5]
create table "public"."collection_publication" (
   "collection_oid"  int4 not null,
   "publication_oid"  int4 not null,
  primary key ("collection_oid", "publication_oid")
);
alter table "public"."collection_publication"   add constraint fk_collection_publication_coll foreign key ("collection_oid") references "public"."collection" ("oid");
alter table "public"."collection_publication"   add constraint fk_collection_publication_publ foreign key ("publication_oid") references "public"."publication" ("oid");
create index "idx_collection_publication_col" on "public"."collection_publication"("collection_oid");
create index "idx_collection_publication_pub" on "public"."collection_publication"("publication_oid");


-- ownedBy [rel6]
alter table "public"."collection"  add column  "researcher_oid"  int4;
alter table "public"."collection"   add constraint fk_collection_researcher foreign key ("researcher_oid") references "public"."researcher" ("oid");
create index "idx_collection_researcher" on "public"."collection"("researcher_oid");


-- Collection_Keyword [rel7]
create table "public"."collection_keyword" (
   "collection_oid"  int4 not null,
   "keyword_oid"  int4 not null,
  primary key ("collection_oid", "keyword_oid")
);
alter table "public"."collection_keyword"   add constraint fk_collection_keyword_collecti foreign key ("collection_oid") references "public"."collection" ("oid");
alter table "public"."collection_keyword"   add constraint fk_collection_keyword_keyword foreign key ("keyword_oid") references "public"."keyword" ("oid");
create index "idx_collection_keyword_collect" on "public"."collection_keyword"("collection_oid");
create index "idx_collection_keyword_keyword" on "public"."collection_keyword"("keyword_oid");


-- sharedWith [rel8]
create table "public"."sharedwith" (
   "collection_oid"  int4 not null,
   "researcher_oid"  int4 not null,
  primary key ("collection_oid", "researcher_oid")
);
alter table "public"."sharedwith"   add constraint fk_sharedwith_collection foreign key ("collection_oid") references "public"."collection" ("oid");
alter table "public"."sharedwith"   add constraint fk_sharedwith_researcher foreign key ("researcher_oid") references "public"."researcher" ("oid");
create index "idx_sharedwith_collection" on "public"."sharedwith"("collection_oid");
create index "idx_sharedwith_researcher" on "public"."sharedwith"("researcher_oid");


-- Researcher_University [rel9]
create table "public"."researcher_university" (
   "researcher_oid"  int4 not null,
   "university_oid"  int4 not null,
  primary key ("researcher_oid", "university_oid")
);
alter table "public"."researcher_university"   add constraint fk_researcher_university_resea foreign key ("researcher_oid") references "public"."researcher" ("oid");
alter table "public"."researcher_university"   add constraint fk_researcher_university_unive foreign key ("university_oid") references "public"."university" ("oid");
create index "idx_researcher_university_rese" on "public"."researcher_university"("researcher_oid");
create index "idx_researcher_university_univ" on "public"."researcher_university"("university_oid");


-- GEN FK: Author --> Researcher
alter table "public"."author"   add constraint fk_author_researcher foreign key ("researcher_oid") references "public"."researcher" ("oid");


