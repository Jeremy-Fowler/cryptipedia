import { APIItem } from "./APIItem.js";

export class Classification extends APIItem {
  constructor(data) {
    super(data)
    this.title = data.title
    this.description = data.description
    this.cryptidImg = data.cryptidImg
    this.terrainImg = data.terrainImg
  }

  get terrainBackgroundImgUrl() {
    return `url(${this.terrainImg})`
  }
}

export class CryptidClassificationClassification extends Classification {
  constructor(data) {
    super(data)
    this.cryptidClassificationId = data.cryptidClassificationId
  }
}