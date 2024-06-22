import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["list", "formTemplate", "postTemplate"];

  add() {
    const li = document.createElement("li");
    const formEl = this.#createFormEl();
    li.appendChild(formEl);
    this.listTarget.appendChild(li);
  }

  #createFormEl() {
    const formEl = this.formTemplateTarget.content.cloneNode(true);
    formEl.querySelector("form").addEventListener("submit", (event) => {
      event.preventDefault();
      const formData = new FormData(event.target);
      const values = Object.fromEntries(formData);
      const postEl = this.#createPostEl(values);
      event.target.replaceWith(postEl);
    });
    return formEl;
  }

  #createPostEl(values) {
    const postEl = this.postTemplateTarget.content.cloneNode(true);
    postEl.querySelector("div").dataset["values"] = JSON.stringify(values);
    return postEl;
  }
}
