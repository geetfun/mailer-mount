/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './app/views/**/*.{erb,html}',
    './app/helpers/**/*.rb',
    './app/mailers/**/*.rb',
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
