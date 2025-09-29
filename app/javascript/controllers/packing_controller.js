import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["status"]

  connect() {}

  togglePacked(event) {
    const checkbox = event.currentTarget
    const span = this.statusTarget

    if (checkbox.checked) {
      span.textContent = "Packed ✅"
    } else {
      span.textContent = ""
    }
  }
}
