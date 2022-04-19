import { Controller } from "stimulus"
import EasyMDE from "easymde"

export default class extends Controller {
  connect() {
    new EasyMDE({ element: this.element })
  }
}
