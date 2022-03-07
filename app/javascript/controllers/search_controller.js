import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "searchbar", "body", "input"]

  expand(event) {
    event.preventDefault()
    this.searchbarTarget.classList.toggle("search-box-active")
    this.inputTarget.focus()
  }
}
