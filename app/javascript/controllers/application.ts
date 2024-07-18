import { Application } from "@hotwired/stimulus"

declare global {
  interface Window {
    Stimulus: any;
  }
}

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
