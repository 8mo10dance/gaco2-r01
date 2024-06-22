import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["content"];

  connect() {
    const values = JSON.parse(this.element.dataset.values);
    this.contentTarget.textContent = values.content;
  }
}
