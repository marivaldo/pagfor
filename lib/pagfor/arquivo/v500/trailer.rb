module Pagfor::V500::Arquivo
  class Trailer < BinData::Record

    include Pagfor::DefaultMixin

    string :identificacao_registro,  :length => 1, :initial_value => '9', :pad_byte => '0'

    lstring :totais_qtde_registros,   :length => 6, :pad_byte => '0'
    lstring :totais_valor,            :length => 17, :pad_byte => '0'

    string :reserva_1,               :length => 470, :pad_byte => ' '

    lstring :sequencial,              :length => 6, :pad_byte => '0'
  end
end