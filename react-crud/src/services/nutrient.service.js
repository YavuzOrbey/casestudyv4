import http from "../http-common";

class NutrientDataService {
 getAll() {
    return http.get("/nutrients");
  }

}

export default new NutrientDataService();