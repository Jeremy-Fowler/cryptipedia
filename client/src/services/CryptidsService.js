import { AppState } from "@/AppState.js"
import { api } from "./AxiosService.js"
import { Cryptid } from "@/models/Cryptid.js"

class CryptidsService {
  async getCryptidById(cryptidId) {
    AppState.activeCryptid = null
    const res = await api.get(`api/cryptids/${cryptidId}`)
    AppState.activeCryptid = new Cryptid(res.data)
  }
  async getCryptids() {
    const res = await api.get('api/cryptids')
    AppState.cryptids = res.data.map(c => new Cryptid(c))
  }
}

export const cryptidsService = new CryptidsService()