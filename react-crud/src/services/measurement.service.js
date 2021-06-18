import http from "../http-common";

class MeasurementDataService {
 getAll() {
    return http.get("/measurements");
  }

}

export default new MeasurementDataService();