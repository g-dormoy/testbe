import { Injectable } from '@nestjs/common';
import { Manufacturer } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class ManufacturerService {
  constructor(private prisma: PrismaService) {}

  async getManufacturer(id: number) {
    return this.prisma.manufacturer.findUnique({
      where: { id },
    });
  }

  async getManufacturers() {
    return this.prisma.manufacturer.findMany();
  }

  async createManufacturer(manufacturer: Manufacturer) {
    return this.prisma.manufacturer.create({ data: manufacturer });
  }

  async updateManufacturer(id: number, manufacturer: Manufacturer) {
    return this.prisma.manufacturer.update({
      where: { id },
      data: manufacturer,
    });
  }

  async deleteManufacturer(id: number) {
    return this.prisma.manufacturer.delete({ where: { id } });
  }
}
