/*
  Warnings:

  - You are about to drop the column `cout` on the `Equipment` table. All the data in the column will be lost.
  - Added the required column `cost` to the `Equipment` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Equipment" DROP COLUMN "cout",
ADD COLUMN     "cost" INTEGER NOT NULL;
