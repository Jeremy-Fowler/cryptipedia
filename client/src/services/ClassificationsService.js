import { logger } from "@/utils/Logger.js"
import { api } from "./AxiosService.js"
import { AppState } from "@/AppState.js"
import { Classification } from "@/models/Classification.js"

class ClassificationsService {
  async getClassificationById(classificationId) {
    const res = await api.get(`api/classifications/${classificationId}`)
    AppState.activeClassification = new Classification(res.data)
  }
}

export const classificationsService = new ClassificationsService()