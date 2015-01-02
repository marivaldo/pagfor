require "pagfor/version"

require "bindata"

require "pagfor/ext/attribute_accessors"
require "pagfor/ext/bindata"
require "pagfor/ext/lstring"
require "pagfor/ext/default_mixin"
require "pagfor/ext/transacao_mixin"
require "pagfor/ext/filler"

require "pagfor/arquivo/lote"

require "pagfor/transacoes/v500/transacao"

require "pagfor/arquivo/arquivo"

require "pagfor/arquivo/v500/header"
require "pagfor/arquivo/v500/trailer"

require "pagfor/pagamentos/v500/header"
require "pagfor/pagamentos/v500/trailer"

require "pagfor/arquivo/estrutura"
require "pagfor/arquivo/builder"

require "pagfor/helper/helper"
require "pagfor/helper/pagamento_bradesco"

module Pagfor

  mod_attr_accessor :defaults
  @@defaults = {}

  mod_attr_accessor :fallback
  @@fallback = "V500"

  mod_attr_accessor :auto_fill_enabled
  @@auto_fill_enabled = true

  def self.setup
    yield self
  end

end
