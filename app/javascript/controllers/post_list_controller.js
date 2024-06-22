import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["list", "formTemplate"];

  add() {
    const li = document.createElement("li");
    const formEl = this.#createFormEl();
    li.appendChild(formEl);
    this.listTarget.appendChild(li);
  }

  #createFormEl() {
    const formEl = this.formTemplateTarget.content.cloneNode(true);
    return formEl;
  }
}
