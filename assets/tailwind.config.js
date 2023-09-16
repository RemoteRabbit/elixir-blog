// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration

const plugin = require("tailwindcss/plugin")
const fs = require("fs")
const path = require("path")

module.exports = {
  content: [
    "./js/**/*.js",
    "../lib/*_web.ex",
    "../lib/*_web/**/*.*ex"
  ],
  theme: {
    extend: {
      colors: {
        'dark_purple': { 
            DEFAULT: '#1c0b19', 
            100: '#060205', 
            200: '#0c050a', 
            300: '#120710', 
            400: '#180915', 
            500: '#1c0b19', 
            600: '#612656', 
            700: '#a54092', 
            800: '#ca78bb', 
            900: '#e5bbdd' 
            }, 
        'federal_blue': { 
            DEFAULT: '#140d4f', 
            100: '#040310', 
            200: '#080520', 
            300: '#0c082f', 
            400: '#100a3f', 
            500: '#140d4f', 
            600: '#251997', 
            700: '#3927dc', 
            800: '#7b6fe8', 
            900: '#bdb7f3' 
        }, 
        'keppel': { 
            DEFAULT: '#4ea699', 
            100: '#10211f', 
            200: '#1f433d', 
            300: '#2f645c', 
            400: '#3f857b', 
            500: '#4ea699', 
            600: '#6fbbb0', 
            700: '#93ccc3', 
            800: '#b7ddd7', 
            900: '#dbeeeb' 
        }, 
        'emerald': { 
            DEFAULT: '#2dd881', 
            100: '#082c19', 
            200: '#105833', 
            300: '#18844c', 
            400: '#20b066', 
            500: '#2dd881', 
            600: '#56e099', 
            700: '#80e8b2', 
            800: '#abf0cc', 
            900: '#d5f7e5' 
        }, 
        'aquamarine': { 
            DEFAULT: '#6fedb7', 
            100: '#083e26', 
            200: '#0f7b4d', 
            300: '#17b973', 
            400: '#30e597', 
            500: '#6fedb7', 
            600: '#8bf1c5', 
            700: '#a8f4d3', 
            800: '#c5f8e2', 
            900: '#e2fbf0' 
        }
      },
        fontFamily: {
                brand: ["Saira", "sans-serif"],
            },
        fontWeight: {
                regular: "normal",
                bold: "bold"
            }
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    // Allows prefixing tailwind classes with LiveView classes to add rules
    // only when LiveView classes are applied, for example:
    //
    //     <div class="phx-click-loading:animate-ping">
    //
    plugin(({addVariant}) => addVariant("phx-no-feedback", [".phx-no-feedback&", ".phx-no-feedback &"])),
    plugin(({addVariant}) => addVariant("phx-click-loading", [".phx-click-loading&", ".phx-click-loading &"])),
    plugin(({addVariant}) => addVariant("phx-submit-loading", [".phx-submit-loading&", ".phx-submit-loading &"])),
    plugin(({addVariant}) => addVariant("phx-change-loading", [".phx-change-loading&", ".phx-change-loading &"])),

    // Embeds Heroicons (https://heroicons.com) into your app.css bundle
    // See your `CoreComponents.icon/1` for more information.
    //
    plugin(function({matchComponents, theme}) {
      let iconsDir = path.join(__dirname, "./vendor/heroicons/optimized")
      let values = {}
      let icons = [
        ["", "/24/outline"],
        ["-solid", "/24/solid"],
        ["-mini", "/20/solid"]
      ]
      icons.forEach(([suffix, dir]) => {
        fs.readdirSync(path.join(iconsDir, dir)).map(file => {
          let name = path.basename(file, ".svg") + suffix
          values[name] = {name, fullPath: path.join(iconsDir, dir, file)}
        })
      })
      matchComponents({
        "hero": ({name, fullPath}) => {
          let content = fs.readFileSync(fullPath).toString().replace(/\r?\n|\r/g, "")
          return {
            [`--hero-${name}`]: `url('data:image/svg+xml;utf8,${content}')`,
            "-webkit-mask": `var(--hero-${name})`,
            "mask": `var(--hero-${name})`,
            "mask-repeat": "no-repeat",
            "background-color": "currentColor",
            "vertical-align": "middle",
            "display": "inline-block",
            "width": theme("spacing.5"),
            "height": theme("spacing.5")
          }
        }
      }, {values})
    })
  ]
}
