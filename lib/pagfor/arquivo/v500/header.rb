module Pagfor::V500::Arquivo
  class Header < BinData::Record

    include Pagfor::DefaultMixin

    string :identificacao_registro,     :length => 1, :initial_value => '0', :pad_byte => '0'
    lstring :codigo_comunicacao,         :length => 8, :initial_value => '0', :pad_byte => '0'

    string :empresa_tipo,              :length => 1, :pad_byte => '0'
    lstring :empresa_numero,            :length => 15, :pad_byte => '0'
    string :empresa_nome,              :length => 40, :pad_byte => ' '

    string  :servico_tipo,              :length => 2, :initial_value => '20', :pad_byte => '0'
    string  :arquivo_origem,            :length => 1, :initial_value => '1', :pad_byte => '0'
    string  :arquivo_sequencia,         :length => 5, :pad_byte => '0'
    string  :arquivo_retorno,           :length => 5, :initial_value => '0', :pad_byte => '0'
    lstring :arquivo_data_geracao,      :length => 8, :pad_byte => '0'
    lstring :arquivo_hora_geracao,      :length => 6, :pad_byte => '0'
    lstring :arquivo_densidade,         :length => 5, :pad_byte => ' '
    lstring :arquivo_unidade_densidade, :length => 3, :pad_byte => ' '

    lstring :id_modulo_micro,           :length => 5, :pad_byte => ' '

    lstring :tipo_processamento,        :length => 1, :pad_byte => '0'

    string  :reservado_empresa,         :length => 74, :pad_byte => ' '
    string  :reservado_banco_1,         :length => 80, :pad_byte => ' '
    string  :reservado_banco_2,         :length => 217, :pad_byte => ' '
    lstring  :numero_lista_debito,       :length => 9, :initial_value => '0', :pad_byte => '0'
    string  :reservado_banco_3,         :length => 8, :pad_byte => ' '

    lstring  :sequencial_header,         :length => 6, :initial_value => '1', :pad_byte => '0'

  end
end