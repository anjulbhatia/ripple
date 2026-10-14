BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "otp_challenges" (
    "id" bigserial PRIMARY KEY,
    "email" text NOT NULL,
    "codeHash" text NOT NULL,
    "expiresAt" timestamp without time zone NOT NULL,
    "attempts" bigint NOT NULL DEFAULT 0,
    "consumed" boolean NOT NULL DEFAULT false,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "otp_challenges_email_idx" ON "otp_challenges" USING btree ("email");


--
-- MIGRATION VERSION FOR ripple
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('ripple', '20261014202717080', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261014202717080', "timestamp" = now();

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
