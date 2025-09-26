const baseGrammar = require('../base.grammar.js')

module.exports = grammar({
  ...baseGrammar,

  name: 'rust_with_bemcss',

  rules: {
    ...baseGrammar.rules,
  },
})
