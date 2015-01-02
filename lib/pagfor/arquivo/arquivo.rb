module Pagfor::Arquivo
  class Arquivo

    attr_accessor :header
    attr_accessor :lotes
    attr_accessor :trailer
    attr_accessor :versao

    def initialize(versao = "V500")
      @versao = versao
      @header = eval("Pagfor::#{versao}::Arquivo::Header").new
      @trailer = eval("Pagfor::#{versao}::Arquivo::Trailer").new
      @lotes = []
    end

    def linhas
      self.auto_fill if Pagfor.auto_fill_enabled
      a = []
      a << @header.linha
      @lotes.each do |lote|
        lote.linhas.each do |linha|
          a << linha
        end
      end
      a << @trailer.linha
      a
    end

    def <<(lote)
      lote.arquivo = self
      @lotes << lote
    end

    def string
      linhas.join("\r\n") << "\r\n"
    end
    
    # Writes +Pagfor::Arquivo::Arquivo+ contents into a +File+, overwriting its current contents.
    #
    # @example Save contents to a file.
    #   Pagfor::Arquivo::Arquivo.new.save_to_file('/tmp/pagfor.txt')
    #
    # @param [ String ] filename The file name to which the contents will be saved to.
    #
    # @return [ Integer ] The number of bytes written to the file.
    #
    # @since 0.0.20
    def save_to_file(filename)
      File.open(filename, 'w'){|f| f.write(string)}
    end
    
    # Loads contents from a +File+ into +Pagfor::Arquivo::Arquivo+ instances.
    #
    # @example Load contents from a file.
    #   Pagfor::Arquivo::Arquivo.load_from_file('/tmp/pagfor.txt')
    #
    # @param [ String ] filename The file name from which the contents will be read.
    #
    # @return [ Array<Pagfor::Arquivo::Arquivo> ] A list of +Pagfor::Arquivo::Arquivo+ instances representing the contents read.
    #
    # @since 0.0.20
    def self.load_from_file(filename)
      load(File.open(filename, 'r'))
    end

    # Loads contents from an object that implements the +IO+ interface into +Pagfor::Arquivo::Arquivo+ instances.
    #
    # @example Load contents from a file.
    #   Pagfor::Arquivo::Arquivo.load_from_file(File.open('/tmp/pagfor.txt', 'r'))
    #
    # @param [ IO ] file The I/O interface from which the contents will be read.
    #
    # @return [ Array<Pagfor::Arquivo::Arquivo> ] A list of +Pagfor::Arquivo::Arquivo+ instances representing the contents read.
    #
    # @since 0.0.20
    def self.load(io)
      Pagfor::Builder.new(io).arquivos
    end

    def auto_fill
      qtd_registros = 0
      _total = 0
      lotes.each { |l|
        qtd_registros += l.transacoes.length
        l.transacoes.each { |trans| _total += trans[:valor_pagamento].to_i }
      } # transacoes
      qtd_registros += 2 # header e trailer de arquivo
      trailer.totais_qtde_registros = qtd_registros.to_s
      trailer.sequencial = qtd_registros.to_s
      trailer.totais_valor =_total.to_s
    end

  end

end
