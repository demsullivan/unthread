// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { registerControllers } from 'stimulus-vite-helpers'
import { application } from "./application"

const controllers = import.meta.glob('./**/*_controller.ts', { eager: true })
registerControllers(application, controllers)
