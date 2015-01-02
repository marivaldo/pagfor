module Pagfor
  class Builder

    HEADER_ARQUIVO = '0'
    HEADER_LOTE = '1'
    INICIAIS_LOTE = '2'
    DETALHE = '3'
    FINAIS_LOTE = '4'
    TRAILER_LOTE = '5'
    TRAILER_ARQUIVO = '9'

    RANGE_TIPO_REGISTRO = 7..7
    RANGE_LAYOUT_ARQUIVO = 163..165
    RANGE_HEADER_LOTE = 13..15
    RANGE_TIPO_OPERACAO_DETALHE = 13..13

    attr_accessor :arquivos

    def initialize(io = nil)
      load(io) unless io.nil?
    end

    def load(io)
      @arquivos = []
      line_number = 0
      io.each_line do |line|
        check_line_encoding line, ++line_number
        case line[RANGE_TIPO_REGISTRO]

          when HEADER_ARQUIVO
            find_header_arquivo line, line_number

          when HEADER_LOTE
            find_header_lote line, line_number

          when INICIAIS_LOTE
            raise NotImplementedError.new("Tipo de registro nao suportado")

          when DETALHE
            find_transacao line, line_number

          when FINAIS_LOTE
            raise NotImplementedError.new("Tipo de registro not implemented")

          when TRAILER_LOTE
            arquivos.last.lotes.last.trailer.read(line)

          when TRAILER_ARQUIVO
            arquivos.last.trailer.read(line)

          else
            raise "Invalid tipo de registro: #{line[RANGE_TIPO_REGISTRO]} at line #{line_number} \n\t Line: [#{line}]"
        end
      end
      arquivos
    end

    private

    def check_line_encoding(line, line_number = -1)
      line = line.force_encoding("US-ASCII").encode("UTF-8", :invalid => :replace) if line.respond_to?(:force_encoding)
      line.gsub!("\r", "")
      line.gsub!("\n", "")
      raise "Invalid line length: #{line.length} expected 500 at line number #{line_number}\n\t Line: [#{line}]" unless line.length == 500
      line
    end

    def find_header_arquivo(line, line_number = -1)
      arquivos << Pagfor::Arquivo::Arquivo.new
      case line[RANGE_LAYOUT_ARQUIVO]
        when '500'
          arquivos.last.versao = 'V500'
          arquivos.last.header = Pagfor::V500::Arquivo::Header.read(line)
        else
          raise "Versao de arquivo nao suportado: #{line[RANGE_LAYOUT_ARQUIVO]} na linha #{line_number}" if Pagfor.fallback == false
          arquivos.last.versao = 'V500'
          arquivos.last.header = Pagfor::V500::Arquivo::Header.read(line)
      end
    end

  end
end