# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[
  ['Anselmo Neto',          'PP',   0, 106, 0,  13, 2, 67,  7,  110, 305],
  ['Antonio Silvano',       'PMDB', 0, 6,   1,  5,  1, 82,  3,  168, 266],
  ['Carlos Leite',          'PT',   0, 60,  1,  0,  0, 1,   1,  53,  116],
  ['Cláudio do Sorocaba I', 'PR',   0, 67,  1,  9,  1, 23,  1,  85,  187],
  ['Engenheiro Martinez',   'PSDB', 0, 8,   6,  28, 0, 270, 5,  261, 578],
  ['Fernando Dini',         'PMDB', 0, 8,   0,  1,  0, 4,   0,  49,  62 ],
  ['Francisco França',      'PT',   0, 148, 4,  10, 1, 44,  2,  85,  294],
  ['Irineu Toledo',         'PRB',  0, 150, 0,  1,  1, 22,  1,  156, 331],
  ['Izídio de Brito',       'PT',   0, 118, 42, 7,  1, 57,  1,  207, 433],
  ['Jessé Loures',          'PV',   0, 113, 2,  0,  0, 7,   1,  57,  180],
  ['José Crespo',           'DEM',  1, 55,  31, 31, 8, 231, 23, 218, 598],
  ['Marinho Marte',         'PPS',  1, 0,   10, 17, 2, 116, 6,  86,  238],
  ['Muri de Brigadeiro',    'PRP',  0, 0,   0,  0,  0, 0,   0,  24,  24 ],
  ['Pastor Apolo',          'PSB',  0, 19,  0,  0,  0, 2,   0,  45,  66 ],
  ['Paulo Mendes',          'PSDB', 0, 21,  1,  8,  0, 50,  2,  44,  126],
  ['Pr. Luis Santos',       'PMN',  0, 29,  8,  18, 1, 49,  2,  152, 259],
  ['Rodrigo Manga',         'PP',   0, 100, 1,  1,  0, 5,   0,  41,  148],
  ['Saulo do Afro Art\'s',  'PRP',  0, 161, 0,  0,  0, 2,   0,  62,  225],
  ['Waldecir Morelly',      'PRP',  0, 81,  0,  0,  0, 1,   0,  59,  141],
  ['Waldomiro de Freitas',  'PSD',  0, 2,   1,  1,  0, 1,   0,  21,  26 ]
].each do |data|
  Alderman.create!(
    name:            data[0],
    political_party: data[1],
    cpi:             data[2],
    ind:             data[3],
    moc:             data[4],
    pdl:             data[5],
    pelom:           data[6],
    plo:             data[7],
    pre:             data[8],
    req:             data[9],
    total:           data[10]
  )
end
