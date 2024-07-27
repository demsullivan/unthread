/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./app/components/**/*.{rb,html.erb}",
    "./app/views/**/*.{html,html.erb,erb}",
    "./app/javascript/**/*.{ts,js}"
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}

