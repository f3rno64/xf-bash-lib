const { Signale } = require('signale')
const _isEmpty = require('lodash/isEmpty')

const {
  LOGGER_SCOPE = 'xf-bash-lib'
} = process.env

const getLogger = (scope = '') => (
  _isEmpty(scope)
    ? new Signale({ scope: LOGGER_SCOPE })
    : new Signale({ scope: `${LOGGER_SCOPE}:${scope}` })
)

module.exports = getLogger
