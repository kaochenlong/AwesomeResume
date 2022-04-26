import { Controller } from "stimulus"
import dropin from "braintree-web-drop-in"

export default class extends Controller {
  connect() {
    const token = this.element.dataset.token

    dropin
      .create({
        authorization: token,
        container: this.element,
      })
      .then((dropinInstance) => {
        console.log("ok!")
        // TODO:
        // 進行刷卡
      })
      .catch((err) => {
        console.log(err)
      })
  }
}
