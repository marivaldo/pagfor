module Pagfor

  ESTRUTURA_V500 = {
    :pagamento => {
      :header => Pagfor::V500::Pagamentos::Header,
      :trailer => Pagfor::V500::Pagamentos::Trailer,
      :transacoes =>  {
        :remessa => true,
        :retorno => true
      }
    }
  }

  ESTRUTURA = {
    'V500' => ESTRUTURA_V500
  }

end