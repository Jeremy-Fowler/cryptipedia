import { AppState } from "@/AppState.js"
import { api } from "./AxiosService.js"
import { CryptidClassificationClassification } from "@/models/Classification.js"
import { CryptidClassificationCryptid } from "@/models/Cryptid.js"

class CryptidClassificationsService {
  async createCryptidClassification(cryptidClassificationData) {
    const res = await api.post('api/cryptidClassifications', cryptidClassificationData)
    AppState.cryptidClassifications.push(new CryptidClassificationClassification(res.data))
  }
  async deleteCryptidClassification(cryptidClassificationId) {
    await api.delete(`api/cryptidClassifications/${cryptidClassificationId}`)
    const index = AppState.cryptidClassifications.findIndex(c => c.cryptidClassificationId == cryptidClassificationId)
    AppState.cryptidClassifications.splice(index, 1)
  }
  async getCryptidsByClassificationById(classificationId) {
    const res = await api.get(`api/classifications/${classificationId}/cryptids`)
    AppState.cryptids = res.data.map(c => new CryptidClassificationCryptid(c))
  }
  async getCryptidClassificationsByCryptidId(cryptidId) {
    const res = await api.get(`api/cryptids/${cryptidId}/classifications`)
    AppState.cryptidClassifications = res.data.map(c => new CryptidClassificationClassification(c))
  }

}

export const cryptidClassificationsService = new CryptidClassificationsService()