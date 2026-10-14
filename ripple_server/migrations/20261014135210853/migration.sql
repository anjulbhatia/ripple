BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "app_data" (
    "id" bigserial PRIMARY KEY,
    "ownerUserId" uuid,
    "appId" bigint NOT NULL,
    "dataKey" text NOT NULL,
    "dataValue" text,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "app_data_app_key_idx" ON "app_data" USING btree ("appId", "dataKey");
CREATE INDEX "app_data_owner_idx" ON "app_data" USING btree ("ownerUserId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "app_definitions" (
    "id" bigserial PRIMARY KEY,
    "ownerUserId" uuid,
    "name" text NOT NULL,
    "description" text,
    "uiDefinition" text NOT NULL,
    "schemaVersion" bigint NOT NULL DEFAULT 1,
    "isPublished" boolean NOT NULL DEFAULT false,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "app_definitions_owner_idx" ON "app_definitions" USING btree ("ownerUserId");
CREATE INDEX "app_definitions_updated_idx" ON "app_definitions" USING btree ("updatedAt");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "magic_links" (
    "id" bigserial PRIMARY KEY,
    "token" text NOT NULL,
    "appId" bigint NOT NULL,
    "createdByUserId" uuid,
    "expiresAt" timestamp without time zone,
    "revoked" boolean NOT NULL DEFAULT false,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "magic_links__token__unique_idx" ON "magic_links" USING btree ("token");
CREATE INDEX "magic_links_app_idx" ON "magic_links" USING btree ("appId");


--
-- MIGRATION VERSION FOR ripple
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('ripple', '20261014135210853', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261014135210853', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260824182259319', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260824182259319', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20260924105404509', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260924105404509', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20260924105232991', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260924105232991', "timestamp" = now();


COMMIT;
