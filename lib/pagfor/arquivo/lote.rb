module Pagfor
  class Lote

    attr_accessor :header
    attr_accessor :transacoes
    attr_accessor :trailer
    attr_accessor :operacao
    attr_accessor :tipo
    attr_accessor :arquivo

    def initialize(options = {})
      @transacoes = []

      @operacao ||= options[:operacao]
      @tipo ||= options[:tipo]
      @versao ||= options[:versao]
      @fallback ||= options[:fallback]
      @versao ||= 'V500'

      raise "Operacao nao suportada: #{operacao}" if ESTRUTURA[@versao][operacao].nil?

      estrutura = ESTRUTURA[@versao][operacao]

      @header = estrutura[:header].new
      @trailer = estrutura[:trailer].new

      yield self if block_given?
    end

    def read_transacao(s, line)
      versao = arquivo.versao unless arquivo.nil?
      versao ||= @versao
      transacoes << trans = eval("Pagfor::#{versao}::Transacao.read(line)")
    end

    def <<(s)
      versao = arquivo.versao unless arquivo.nil?
      versao ||= @versao
      case s
        when Symbol, String
          transacoes << trans = eval("Pagfor::#{versao}::Transacao.new")
        else
          transacoes << trans = s
      end
      trans.lote = self
      trans
    end

    def linhas
      self.auto_fill if Pagfor.auto_fill_enabled
      trans_array = []
      transacoes.each do |s|
        trans_array << s.linha
      end
      trans_array
    end

    def string
      linhas.join("\r\n")
    end

    def auto_fill
      trailer.totais_qtde_registros = (transacoes.length + 2).to_s
      _total = 0
      transacoes.each { |trans| _total += trans[:credito_valor_pagamento].to_i }
      trailer.totais_valor =_total.to_s
    end
  end
end