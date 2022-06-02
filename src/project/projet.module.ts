import { Module } from "@nestjs/common";
import {ProjectResolver} from "./project.resolver";

@Module({
  imports: [],
  providers: [ProjectResolver],
})
export class ProjectModule {}
