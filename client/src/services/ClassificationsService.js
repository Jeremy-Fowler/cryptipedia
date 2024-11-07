import { api } from "./AxiosService.js"
import { AppState } from "@/AppState.js"
import { Classification } from "@/models/Classification.js"

class ClassificationsService {
  async getClassifications() {
    const res = await api.get('api/classifications')
    AppState.classifications = res.data.map(c => new Classification(c))
  }
  async getClassificationById(classificationId) {
    AppState.activeClassification = null
    const res = await api.get(`api/classifications/${classificationId}`)
    AppState.activeClassification = new Classification(res.data)
  }
}

export const classificationsService = new ClassificationsService()