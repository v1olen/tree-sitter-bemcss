/**
 * Tree-sitter grammar definition for bemcss.
 *
 * @author Assistant
 * @license MIT
 */

const rustGrammar = require('./rust.grammar.js')

module.exports = {
  ...rustGrammar,

  name: 'bemcss',

  conflicts: $ => [...rustGrammar.conflicts($)],

  rules: {
    ...rustGrammar.rules,
  },
}
