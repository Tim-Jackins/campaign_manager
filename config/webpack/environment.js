const { environment } = require('@rails/webpacker')
// const coffee =  require('./loaders/coffee')
const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
  })
)

// environment.loaders.prepend('coffee', coffee)
environment.loaders.prepend('coffee', {
  test: /\.coffee$/,
  use: ['cjsx-loader', 'coffee-loader']
})

module.exports = environment
