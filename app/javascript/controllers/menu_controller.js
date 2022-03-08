import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button"]

  connect() {
    console.log("Hello from our first Stimulus controller")
  }

  active(event) {
    this.buttonTargets.forEach((button) => {
      button.classList.remove('menu-active');
      console.log(button)
    })
    event.currentTarget.classList.add('menu-active');
  }
}
