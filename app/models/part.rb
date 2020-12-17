class Part < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: 'Noun（名詞）' },
    { id: 2, name: 'Pronoun（代名詞）' },
    { id: 3, name: 'Verb（動詞）' },
    { id: 4, name: 'Adjective（形容詞）' },
    { id: 5, name: 'Adverb（副詞）' },
    { id: 6, name: 'Preposition（前置詞）' },
    { id: 7, name: 'Conjunction（接続詞）' },
    { id: 8, name: 'Interjection（間投詞）' }
  ]
end