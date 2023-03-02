import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="button"
export default class extends Controller {
static targets = ['expend']

  connect() {

  }

  buttonClick(){
    this.expendClass = this.data.get("show") || "d-none"
    this.expendTarget.classList.toggle(this.expendClass);

  }
}
