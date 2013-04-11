# encoding: utf-8

require 'net/http'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def get_image(id, url)
  response = fetch(url)

  File.new("/tmp/#{id}.jpg",  "w+").tap do |file|
    file.write(response.body.force_encoding('UTF-8'))
  end
end

def fetch(uri_str, limit = 10)
  # You should choose better exception.
  raise ArgumentError, 'HTTP redirect too deep' if limit == 0

  url = URI.parse(uri_str)
  req = Net::HTTP::Get.new(url.path, { 'User-Agent' => 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_3_2 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8H7 Safari/6533.18.5' })
  response = Net::HTTP.start(url.host, url.port) { |http| http.request(req) }

  case response
    when Net::HTTPSuccess     then response
    when Net::HTTPRedirection then fetch(response['location'], limit - 1)
  else
    response.error!
  end
end

[
  ['Anselmo Neto',          'PP',   0, 106, 0,  13, 2, 67,  7,  110, 305, 'http://goo.gl/Mme2W'],
  ['Antonio Silvano',       'PMDB', 0, 6,   1,  5,  1, 82,  3,  168, 266, 'http://goo.gl/kL06S'],
  ['Carlos Leite',          'PT',   0, 60,  1,  0,  0, 1,   1,  53,  116, 'http://goo.gl/cz6D7'],
  ['Cláudio do Sorocaba I', 'PR',   0, 67,  1,  9,  1, 23,  1,  85,  187, 'http://goo.gl/u0MxO'],
  ['Engenheiro Martinez',   'PSDB', 0, 8,   6,  28, 0, 270, 5,  261, 578, 'http://goo.gl/wVcuz'],
  ['Fernando Dini',         'PMDB', 0, 8,   0,  1,  0, 4,   0,  49,  62,  'http://goo.gl/Ro1TI'],
  ['Francisco França',      'PT',   0, 148, 4,  10, 1, 44,  2,  85,  294, 'http://goo.gl/yFUzV'],
  ['Irineu Toledo',         'PRB',  0, 150, 0,  1,  1, 22,  1,  156, 331, 'http://goo.gl/4h2uW'],
  ['Izídio de Brito',       'PT',   0, 118, 42, 7,  1, 57,  1,  207, 433, 'http://goo.gl/WzykC'],
  ['Jessé Loures',          'PV',   0, 113, 2,  0,  0, 7,   1,  57,  180, 'http://goo.gl/sbiq2'],
  ['José Crespo',           'DEM',  1, 55,  31, 31, 8, 231, 23, 218, 598, 'http://goo.gl/ewz2T'],
  ['Marinho Marte',         'PPS',  1, 0,   10, 17, 2, 116, 6,  86,  238, 'http://goo.gl/Lm9Z0'],
  ['Muri de Brigadeiro',    'PRP',  0, 0,   0,  0,  0, 0,   0,  24,  24,  'http://goo.gl/PXFmK'],
  ['Pastor Apolo',          'PSB',  0, 19,  0,  0,  0, 2,   0,  45,  66,  'http://goo.gl/ORI9l'],
  ['Paulo Mendes',          'PSDB', 0, 21,  1,  8,  0, 50,  2,  44,  126, 'http://goo.gl/vF0xY'],
  ['Pr. Luis Santos',       'PMN',  0, 29,  8,  18, 1, 49,  2,  152, 259, 'http://goo.gl/HrnTP'],
  ['Rodrigo Manga',         'PP',   0, 100, 1,  1,  0, 5,   0,  41,  148, 'http://goo.gl/EuXPK'],
  ['Saulo do Afro Art\'s',  'PRP',  0, 161, 0,  0,  0, 2,   0,  62,  225, 'http://goo.gl/rYAZL'],
  ['Waldecir Morelly',      'PRP',  0, 81,  0,  0,  0, 1,   0,  59,  141, 'http://goo.gl/rNIuT'],
  ['Waldomiro de Freitas',  'PSD',  0, 2,   1,  1,  0, 1,   0,  21,  26,  'http://goo.gl/Njpfn']
].each do |data|
  alderman = Alderman.create!(
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

  alderman.photo = get_image(alderman.id, data[11])
  alderman.save
end
