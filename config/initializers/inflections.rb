# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
  inflect.irregular 'colaborador', 'colaboradores'
  inflect.irregular 'servidor', 'servidores'
  inflect.irregular 'fornecedor pessoa jurídica', 'fornecedores pessoa jurídica'
  inflect.irregular 'fornecedor Pessoa Física', 'fornecedores pessoa física'
  inflect.irregular 'cliente pessoa jurídica', 'clientes pessoa jurídica'
  inflect.irregular 'cliente pessoa física', 'clientes pessoa física'
  inflect.irregular 'item de menu', 'itens de menu'

#   inflect.uncountable %w( fish sheep )
end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
