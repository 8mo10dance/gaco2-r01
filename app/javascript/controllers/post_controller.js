import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["content"];

  connect() {
    const values = JSON.parse(this.element.dataset.values);
    this.contentTarget.textContent = values.content;
  }

  edit() {
    const values = {
      content: this.contentTarget.textContent,
    };
    this.element.dispatchEvent(
      new CustomEvent("editPost", {
        detail: { values },
      })
    );
  }
}
