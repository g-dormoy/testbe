import { Query, Resolver } from "@nestjs/graphql";

@Resolver('project')
export class ProjectResolver {
  @Query()
  async project() {
    return {
      name: "Beeldi-api"
    };
  }
}
