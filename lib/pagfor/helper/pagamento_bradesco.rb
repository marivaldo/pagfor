module Pagfor
  class PagamentoBradesco < Helper

    def initialize(campos = {})
      campos[:arquivo_data_geracao] ||= Time.now.strftime("%Y%m%d")
      campos[:arquivo_hora_geracao] ||= Time.now.strftime("%H%M%S")

      @arquivo = Pagfor::Arquivo::Arquivo.new('V500')
      @arquivo.lotes << lote = Pagfor::Lote.new(:operacao => :pagamento, :tipo => :remessa, :versao => 'V500')

      fill campos, arquivo.header, arquivo.trailer

      fill campos, lote.header, lote.trailer
    end

    def add_lote(campos = {})
      @arquivo.lotes << lote = Pagfor::Lote.new(:operacao => :pagamento, :tipo => :remessa, :versao => 'V500')

      fill campos, lote.header
    end

    def <<(campos)
      lote = @arquivo.lotes.last

      campos[:controle_lote] ||= @arquivo.lotes.length.to_s
      campos[:servico_numero_registro] ||= (lote.transacoes.length+1).to_s

      transacao = Pagfor::V500::Transacao.new
      fill campos, transacao

      lote << transacao
    end

  end
end