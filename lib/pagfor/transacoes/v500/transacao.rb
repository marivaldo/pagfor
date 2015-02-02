module Pagfor::V500
  class Transacao < BinData::Record

    include Pagfor::DefaultMixin
    include Pagfor::TransacaoMixin

    string :identificacao_registro, :length => 1, :initial_value => '1', :pad_byte => '0'

    string :favorecido_tipo,             :length => 1, :pad_byte => '0'
    lstring :favorecido_numero_inscricao, :length => 15, :pad_byte => '0'
    string :favorecido_nome,             :length => 30, :pad_byte => ' '
    string :favorecido_endereco,         :length => 40, :pad_byte => ' '
    string :favorecido_cep,              :length => 8, :pad_byte => ' '

    lstring :favorecido_banco,           :length => 3, :pad_byte => ' '
    lstring :favorecido_agencia,         :length => 5, :pad_byte => '0'
    lstring :favorecido_agencia_dv,      :length => 1, :pad_byte => ' '
    lstring :favorecido_conta,           :length => 13, :pad_byte => '0'
    string :favorecido_conta_dv,         :length => 2, :pad_byte => ' '

    lstring :numero_pagamento,           :length => 16, :pad_byte => ' '
    lstring :carteira,                   :length => 3, :initial_value => '0', :pad_byte => '0'
    lstring :nosso_numero,               :length => 12, :initial_value => '0', :pad_byte => '0'
    lstring :seu_numero,                 :length => 15, :initial_value => ' ', :pad_byte => ' '

    lstring :data_vencimento,            :length => 8, :pad_byte => '0'
    lstring :data_emissao,               :length => 8, :pad_byte => '0'
    lstring :data_limite_desconto,       :length => 8, :pad_byte => '0'

    lstring :zeros_1,                    :length => 1, :pad_byte => '0'

    lstring :fator_vencimento,           :length => 4, :pad_byte => '0'

    lstring :valor_documento,            :length => 10, :pad_byte => '0'
    lstring :valor_pagamento,            :length => 15, :pad_byte => '0'
    lstring :valor_desconto,             :length => 15, :pad_byte => '0'
    lstring :valor_acrescimo,            :length => 15, :pad_byte => '0'

    lstring :documento_tipo,             :length => 2, :initial_value => '05', :pad_byte => '0'
    lstring :documento_numero,           :length => 10, :pad_byte => '0'
    lstring :documento_serie,            :length => 2, :pad_byte => ' '

    lstring :pagamento_modalidade,       :length => 2, :initial_value => '01', :pad_byte => '0'

    lstring :data_efetivacao_pagamento,  :length => 8, :pad_byte => '0'

    string :moeda,                       :length => 3, :pad_byte => ' '
    lstring :situacao_agendamento,       :length => 2, :initial_value => '01', :pad_byte => '0'

    string :brancos_1,                   :length => 2, :pad_byte => ' '
    string :brancos_2,                   :length => 2, :pad_byte => ' '
    string :brancos_3,                   :length => 2, :pad_byte => ' '
    string :brancos_4,                   :length => 2, :pad_byte => ' '
    string :brancos_5,                   :length => 2, :pad_byte => ' '

    string :movimento_tipo,              :length => 1, :initial_value => '0', :pad_byte => '0'
    string :movimento_codigo,            :length => 2, :initial_value => '00', :pad_byte => '0'
    string :consulta_realtime,           :length => 4, :pad_byte => ' '
    string :saldo_disponivel,            :length => 15, :pad_byte => ' '
    string :valor_tx_pre_funding,        :length => 15, :pad_byte => ' '
    string :reserva_1,                   :length => 6, :pad_byte => ' '
    string :sacador_avalista,            :length => 40, :pad_byte => ' '
    string :reserva_2,                   :length => 1, :pad_byte => ' '
    string :nivel_informacao_retorno,    :length => 1, :pad_byte => ' '
    lstring :informacoes_complementares, :length => 40, :pad_byte => ' '
    string :codigo_area_empresa,         :length => 2, :pad_byte => '0'
    string :uso_empresa,                 :length => 35, :pad_byte => ' '
    string :reserva_3,                   :length => 22, :pad_byte => ' '
    string :codigo_lancamento,           :length => 5, :pad_byte => ' '
    string :reserva_4,                   :length => 1, :pad_byte => ' '

    string :tipo_conta_favorecido,       :length => 1, :initial_value => '1', :pad_byte => '0'

    lstring :conta_complementar,         :length => 7, :initial_value => '0', :pad_byte => ' '

    string :reserva_5,                   :length => 8, :pad_byte => ' '

    lstring :sequencial,                 :length => 6, :pad_byte => '0'

  end
end