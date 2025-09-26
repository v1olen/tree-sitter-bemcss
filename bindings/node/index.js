const root = require('path').join(__dirname, '..', '..')

module.exports = require('node-gyp-build')(root)

try {
  module.exports.bemcss.nodeTypeInfo = require('../../bemcss/src/node-types.json')
  module.exports.rust_with_bemcss.nodeTypeInfo = require('../../rust_with_bemcss/src/node-types.json')
} catch (_) {}
