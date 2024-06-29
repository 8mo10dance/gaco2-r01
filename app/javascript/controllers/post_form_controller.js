import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    const values = JSON.parse(this.element.dataset.values);
    Object.entries(values).forEach(([k, v]) => {
      this.element.querySelector(`input[name="${k}"]`).value = v;
    });
  }

  submit(event) {
    event.preventDefault();
    event.target.dispatchEvent(new Event("submit"));
  }
}
