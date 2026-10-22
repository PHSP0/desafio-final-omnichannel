
use('omnichannel_nosql');

db.getCollection('logs_navegacao').insertMany([
  {
    cliente_id: 101,
    data_hora: new Date(),
    origem: 'Site',
    dispositivo: 'Mobile',
    pagina_visitada: '/produto/smartphone',
    acoes: ['clique', 'pesquisa'],
    sessao_ativa: true
  },
  {
    cliente_id: 102,
    data_hora: new Date(),
    origem: 'Aplicativo',
    dispositivo: 'Desktop',
    pagina_visitada: '/carrinho',
    acoes: ['clique', 'adicionar_carrinho'],
    sessao_ativa: true
  },
  {
    cliente_id: 103,
    data_hora: new Date(),
    origem: 'Site',
    dispositivo: 'Tablet',
    pagina_visitada: '/busca/notebook',
    acoes: ['pesquisa', 'visualizacao_produto'],
    sessao_ativa: false
  }
]);

// Validar os documentos inseridos
db.getCollection('logs_navegacao').find({});
