import { APIItem } from "./APIItem.js";

export class Profile extends APIItem {
  constructor(data) {
    super(data)
    this.picture = data.picture
    this.name = data.name
  }
}