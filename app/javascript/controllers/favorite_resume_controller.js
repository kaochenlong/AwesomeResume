import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = ["like", "unlike"]

  connect() {
    if (this.element.dataset.liked === "true") {
      this.likeTarget.style.display = "none"
    } else {
      this.unlikeTarget.style.display = "none"
    }
  }

  like(e) {
    e.preventDefault()
    const resumeID = this.element.dataset.resumeId

    Rails.ajax({
      type: "post",
      url: `/api/v1/resumes/${resumeID}/like`,
      success: (data) => {
        if (data.message === "added") {
          this.likeTarget.style.display = "none"
          this.unlikeTarget.style.display = "block"
        }
      },
    })
  }

  unlike(e) {
    e.preventDefault()
    const resumeID = this.element.dataset.resumeId

    Rails.ajax({
      type: "delete",
      url: `/api/v1/resumes/${resumeID}/unlike`,
      success: (data) => {
        if (data.message === "removed") {
          this.likeTarget.style.display = "block"
          this.unlikeTarget.style.display = "none"
        }
      },
    })
  }
}
