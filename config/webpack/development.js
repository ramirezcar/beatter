process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')

module.exports = environment.toWebpackConfig()

environment.loaders.append("bootstrap.native", {
  test: /bootstrap\.native/,
  use: {
    loader: "bootstrap.native-loader",
    options: {
      only: ["alert", "button", "dropdown", "modal", "tab", "toast", "tooltip"],
      bsVersion: 4
    }
  }
})
