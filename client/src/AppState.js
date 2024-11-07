import { reactive } from 'vue'
import { Cryptid, CryptidClassificationCryptid } from './models/Cryptid.js'

// NOTE AppState is a reactive object to contain app level data
export const AppState = reactive({
  /**@type {import('@bcwdev/auth0provider-client').Identity} */
  identity: null,
  /** @type {import('./models/Account.js').Account} user info from the database*/
  account: null,
  /** @type {import('./models/Classification.js').Classification} */
  activeClassification: null,
  /** @type {Cryptid[] | CryptidClassificationCryptid[]} */
  cryptids: [],
  /** @type {Cryptid} */
  activeCryptid: null,
  /** @type {import('./models/Classification.js').CryptidClassificationClassification[]} */
  classifications: []
})

