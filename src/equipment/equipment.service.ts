import { Injectable } from '@nestjs/common';
import { Equipment } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class EquipmentService {
  constructor(private prisma: PrismaService) {}

  async getEquipment(id: number) {
    return this.prisma.equipment.findUnique({
      where: { id },
    });
  }

  async getEquipments() {
    return this.prisma.equipment.findMany();
  }

  async createEquipment(equipment: Equipment) {
    return this.prisma.equipment.create({ data: equipment });
  }

  async updateEquipment(id: number, equipment: Equipment) {
    return this.prisma.equipment.update({
      where: { id },
      data: equipment,
    });
  }

  async deleteEquipment(id: number) {
    return this.prisma.equipment.delete({ where: { id } });
  }
}
