import { AppState } from "@/AppState.js"
import { api } from "./AxiosService.js"
import { CryptidClassificationClassification } from "@/models/Classification.js"
import { CryptidClassificationCryptid } from "@/models/Cryptid.js"

class CryptidClassificationsService {
  async getCryptidsByClassificationById(classificationId) {
    const res = await api.get(`api/classifications/${classificationId}/cryptids`)
    AppState.cryptids = res.data.map(c => new CryptidClassificationCryptid(c))
  }
  async getCryptidClassificationsByCryptidId(cryptidId) {
    const res = await api.get(`api/cryptids/${cryptidId}/classifications`)
    AppState.classifications = res.data.map(c => new CryptidClassificationClassification(c))
  }

}

export const cryptidClassificationsService = new CryptidClassificationsService()