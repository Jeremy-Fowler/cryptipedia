import { APIItem } from "./APIItem.js";
import { Profile } from "./Profile.js";

export class Cryptid extends APIItem {
  constructor(data) {
    super(data)
    this.name = data.name
    this.description = data.description
    this.imgUrl = data.imgUrl
    this.threatLevel = data.threatLevel
    this.size = data.size
    this.discovererId = data.discovererId
    this.discoverer = new Profile(data.discoverer)
  }

  get backgroundImgUrl() {
    return `url(${this.imgUrl})`
  }
}