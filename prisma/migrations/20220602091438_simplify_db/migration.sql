/*
  Warnings:

  - You are about to drop the `Characteristic` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `EquipmentsCharacteristics` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `cout` to the `Equipment` table without a default value. This is not possible if the table is not empty.
  - Added the required column `kwh` to the `Equipment` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "EquipmentsCharacteristics" DROP CONSTRAINT "EquipmentsCharacteristics_characteristicId_fkey";

-- DropForeignKey
ALTER TABLE "EquipmentsCharacteristics" DROP CONSTRAINT "EquipmentsCharacteristics_equipmentId_fkey";

-- AlterTable
ALTER TABLE "Equipment" ADD COLUMN     "cout" INTEGER NOT NULL,
ADD COLUMN     "kwh" INTEGER NOT NULL;

-- DropTable
DROP TABLE "Characteristic";

-- DropTable
DROP TABLE "EquipmentsCharacteristics";

-- DropEnum
DROP TYPE "CharacteristicsTypes";
