import { AppState } from "@/AppState.js"
import { api } from "./AxiosService.js"
import { CryptidClassificationClassification } from "@/models/Classification.js"

class CryptidClassificationsService {
  async getCryptidClassificationsByCryptidId(cryptidId) {
    const res = await api.get(`api/cryptids/${cryptidId}/classifications`)
    AppState.cryptidClassificationClassifications = res.data.map(c => new CryptidClassificationClassification(c))
  }

}

export const cryptidClassificationsService = new CryptidClassificationsService()