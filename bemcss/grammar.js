const baseGrammar = require('../base.grammar.js')

module.exports = grammar({
  ...baseGrammar,

  name: 'bemcss',

  rules: {
    ...baseGrammar.rules,
  },
})
