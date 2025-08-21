-- CreateTable
CREATE TABLE "public"."courses" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "duration" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "courses_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."modules" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "modules_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."courses_modules" (
    "id" TEXT NOT NULL,
    "fk_id_course" TEXT NOT NULL,
    "fk_id_module" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "courses_modules_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "courses_name_key" ON "public"."courses"("name");

-- CreateIndex
CREATE UNIQUE INDEX "modules_name_key" ON "public"."modules"("name");

-- CreateIndex
CREATE INDEX "courses_modules_fk_id_course_idx" ON "public"."courses_modules"("fk_id_course");

-- CreateIndex
CREATE INDEX "courses_modules_fk_id_module_idx" ON "public"."courses_modules"("fk_id_module");

-- CreateIndex
CREATE UNIQUE INDEX "courses_modules_fk_id_course_fk_id_module_key" ON "public"."courses_modules"("fk_id_course", "fk_id_module");

-- AddForeignKey
ALTER TABLE "public"."courses_modules" ADD CONSTRAINT "courses_modules_fk_id_course_fkey" FOREIGN KEY ("fk_id_course") REFERENCES "public"."courses"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."courses_modules" ADD CONSTRAINT "courses_modules_fk_id_module_fkey" FOREIGN KEY ("fk_id_module") REFERENCES "public"."modules"("id") ON DELETE CASCADE ON UPDATE CASCADE;
